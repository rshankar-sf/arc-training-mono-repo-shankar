module "tags" {
  source  = "sourcefuse/arc-tags/aws"
  version = "1.2.3"

  environment = var.environment
  project     = var.namespace

}



################################################################################
## backend
################################################################################
data "aws_iam_policy_document" "backend" {
  count   = var.environment == "poc" || var.environment == "poc" ? 1 : 0
  version = "2012-10-17"

  ## backend state
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = var.environment == "poc" ? [
      ## only support workspaces
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/${var.environment}/",
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/${var.environment}/*"
      ] : [
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/dev/",
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/dev/*",
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/shared-services/",
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/shared-services/*",
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/prod/",
      "arn:${data.aws_partition.this.partition}:s3:::${var.namespace}-${var.environment}-terraform-state/env:/prod/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [
      "arn:${data.aws_partition.this.partition}:dynamodb:*:*:table/${var.namespace}-${var.environment}-terraform-state-lock"
    ]
  }
}

resource "aws_iam_policy" "backend" {
  count = var.environment == "poc" || var.environment == "poc" ? 1 : 0

  name        = "${var.namespace}-${var.environment}-backend-access"
  path        = "/"
  description = "Backend access policy"

  policy = data.aws_iam_policy_document.backend[0].json
}

################################################################################
## role
################################################################################
module "github_iam" {
  source  = "sourcefuse/arc-github-iam/aws"
  version = "0.1.0"

  environment = var.environment
  namespace   = var.namespace

  ## role settings
  github_subscriptions = var.github_subscriptions

  ## policies
  policies = var.policies
  additional_iam_policy_names = concat(
    var.additional_iam_policy_names, length(aws_iam_policy.backend) > 0 ? [
      aws_iam_policy.backend[0].name
  ] : [])

  tags = module.tags.tags
  depends_on = [
    aws_iam_policy.backend
  ]
}

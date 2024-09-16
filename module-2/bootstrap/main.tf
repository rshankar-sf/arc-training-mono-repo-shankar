
###########################################################
###########################################################
module "arc-tags" {
  source      = "sourcefuse/arc-tags/aws"
  version     = "1.2.5"
  environment = var.environment
  project     = var.project_name

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/bootstrap"
  }
}
################################################################
## backend state configuration
################################################################
module "bootstrap" {
  source  = "sourcefuse/arc-bootstrap/aws"
  version = "1.1.3"



  bucket_name   = "${var.project_name}-${var.environment}-${var.bucket_name}"
  dynamodb_name = "${var.project_name}-${var.environment}-${var.dynamodb_name}"

  tags = merge(module.arc-tags.tags, tomap({
    Name         = "${var.project_name}-${var.environment}-${var.bucket_name}"
    DynamoDBName = "${var.project_name}-${var.environment}-${var.dynamodb_name}"
  }))
}

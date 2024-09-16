################################################################################
## shared
################################################################################
variable "region" {
  type        = string
  description = "AWS region"
}

variable "environment" {
  type        = string
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
}

################################################################################
## github
################################################################################
variable "github_subscriptions" {
  type        = list(string)
  description = "GitHub repo subscriptions for AWS account access"
  default = [
    "repo:divyaperumal-sf/arc-iac-training:*",
  ]
}

################################################################################
## iam
################################################################################
variable "additional_iam_policy_names" {
  type        = list(string)
  description = "Additional IAM Policy names to add to the role"
}

variable "policies" {
  description = "The IAM policies to create and attach to the IAM role for managing AWS resources"
  type = list(object({
    name        = string
    path        = optional(string, "/")
    policy_json = any
  }))
  default = []
}

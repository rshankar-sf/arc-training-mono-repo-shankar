################################################################
## shared
################################################################
variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "bucket_name" {
  description = "Name of the bucket."
  type        = string
}

variable "dynamodb_name" {
  description = "Name of the Dynamo DB lock table."
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "environment" {
  type        = string
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

# variable "namespace" {
#   description = "Name of the namespace"
#   type        = string
# }

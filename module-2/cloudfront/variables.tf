
variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "region" {
  description = "aws_region"
  type        = string
}


variable "repo_name" {
  description = "Repository name for extra tags"
  type        = string
}


variable "namespace" {
  description = "Namespace for CloudFront"
  type        = string
}


variable "route53_root_domain" {
  description = "The root domain for Route 53"
  type        = string
}

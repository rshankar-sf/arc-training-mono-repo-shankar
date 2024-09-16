# Required Terraform version and providers
terraform {
  required_version = ">= 1.3.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67.0" # Use the same version as in your official doc
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.0"
    }
  }
  backend "s3" {}
}

# Default AWS provider for the current region
provider "aws" {
  region = var.region
}

# AWS provider alias for lambda@edge (us-east-1 required)
provider "aws" {
  region = var.region
  alias  = "lambda_at_edge"
}

# AWS provider alias for ACM (certificate management in us-east-1)
provider "aws" {
  region = var.region
  alias  = "acm"
}

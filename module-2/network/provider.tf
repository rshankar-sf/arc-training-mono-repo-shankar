terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }

    awsutils = {
      source  = "cloudposse/awsutils"
      version = "~> 0.15"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.region
}

provider "awsutils" {
  region = var.region
}

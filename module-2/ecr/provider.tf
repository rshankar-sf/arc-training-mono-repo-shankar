terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }

    null = {
      version = "~> 3.2"
      source  = "hashicorp/null"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

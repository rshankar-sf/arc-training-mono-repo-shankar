# terraform {
#   required_version = "~> 1.5"

#   required_providers {
#     aws = {
#       version = "~> 5.0"
#       source  = "hashicorp/aws"
#     }
#   }
# }

# provider "aws" {
#   region = var.region
# }

terraform {
  required_version = "~> 1.5"

  required_providers {
    aws = {
      version = "~> 5.0"
      source  = "hashicorp/aws"
    }
    random = {
      version = "~> 3.0"
      source  = "hashicorp/random"
    }
  }
}

provider "aws" {
  region = var.region
}
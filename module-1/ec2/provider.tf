# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.61.0"
#     }
#   }
# }

# provider "aws" {
#   region = var.region
# }

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4" # Specify the version you want to use
    }
  }
}

provider "aws" {
  region = var.region
}

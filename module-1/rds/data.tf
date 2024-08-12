# # Fetch the VPC by tag name
# data "aws_vpc" "vpc" {
#   filter {
#     name   = "tag:Name"
#     values = [
#       "${var.namespace}-${var.organisation}-${var.environment}-vpc"
#     ]
#   }
# }

# # Fetch all public subnets associated with the VPC
# data "aws_subnet" "private" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.vpc.id]
#   }

#   filter {
#     name   = "tag:Name"
#     values = [
#       ["*-private-subnet-*"]
#     ]
#   }
# }

# # Get the current AWS account information
# data "aws_caller_identity" "current" {}


# Fetch the VPC by tag name
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.organisation}-${var.environment}-vpc"]
  }
}

# Fetch all private subnets associated with the VPC
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["*-private-subnet-*"]
  }
}

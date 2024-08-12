# # Fetch the VPC by tag name
# data "aws_vpc" "vpc" {
#   filter {
#     name = "tag:Name"
#     values = [
#       "${var.namespace}-${var.organisation}-${var.environment}-vpc"
#     ]
#   }
# }

# # Fetch all public subnets associated with the VPC
# data "aws_subnet" "public" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.vpc.id]
#   }

#   filter {
#     name = "tag:Name"
#     values = [
#       "*-public-subnet-1"
#     ]
#   }
# }

# # Fetch all private subnets associated with the VPC
# data "aws_subnets" "private" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.vpc.id]
#   }

#   filter {
#     name   = "tag:Name"
#     values = ["*-private-subnet-*"]
#   }
# }

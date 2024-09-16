###############################################
## imports
################################################
## network
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc"]
  }
}

## network
data "aws_subnets" "public" {
  filter {
    name = "tag:Name"
    values = [
      "${var.namespace}-${var.environment}--subnet-public1-${var.region}a",
      "${var.namespace}-${var.environment}--subnet-public2-${var.region}b"
    ]
  }
}

data "aws_subnets" "private" {
  filter {
    name = "tag:Name"
    values = [
      "${var.namespace}-${var.environment}--subnet-private1-${var.region}a",
      "${var.namespace}-${var.environment}--subnet-private2-${var.region}b"
    ]
  }
}

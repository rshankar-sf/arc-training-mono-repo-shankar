locals {
  private_subnets = [
    {
      name              = "${var.namespace}-${var.environment}-private-${var.region}a"
      availability_zone = "${var.region}a"
      cidr_block        = "10.0.0.128/25"
    },
    {
      name              = "${var.namespace}-${var.environment}-private-${var.region}b"
      availability_zone = "${var.region}b"
      cidr_block        = "10.0.1.0/25"
    }
  ]

  public_subnets = [
    {
      name              = "${var.namespace}-${var.environment}-public-${var.region}a"
      availability_zone = "${var.region}a"
      cidr_block        = "10.0.0.0/26"
    },
    {
      name              = "${var.namespace}-${var.environment}-public-${var.region}b"
      availability_zone = "${var.region}b"
      cidr_block        = "10.0.0.64/26"
    }
  ]

  # Map of AZ to NAT Gateway ID for private subnets
  custom_az_ngw_ids = {
    "${var.region}a" = aws_nat_gateway.example.id
    "${var.region}b" = aws_nat_gateway.example.id
  }
}

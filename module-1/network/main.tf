
# AWS Virtual Private Cloud (VPC)
resource "aws_vpc" "vpc" {
  cidr_block                           = var.vpc_cidr_block
  instance_tenancy                     = var.instance_tenancy
  enable_dns_support                   = var.enable_dns_support
  enable_dns_hostnames                 = var.enable_dns_hostnames
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  tags = {
    "Name" = "${var.namespace}-${var.organisation}-${var.environment}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.namespace}-${var.organisation}-${var.environment}-igw"
  }
}

# Public Subnets
resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    "Name" = each.value.name
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    "Name" = each.value.name
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.namespace}-${var.organisation}-${var.environment}-private-route-table"
  }
}


# Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.namespace}-${var.organisation}-${var.environment}-private-route-table"
  }
}

# Associate Private Route Table with Private Subnets
resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}


resource "aws_eip" "nat" {
  count = length(var.public_subnets) > 0 ? 1 : 0
}

resource "aws_nat_gateway" "nat" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[element(keys(var.public_subnets), 0)].id

  tags = {
    Name = "${var.namespace}-${var.organisation}-${var.environment}-ngw"
  }
}

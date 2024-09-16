################################################################
## defaults
################################################################

module "tags" {
  source      = "sourcefuse/arc-tags/aws"
  version     = "1.2.5"
  environment = var.environment
  project     = var.project_name

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/network"
  }
}

##############################################################################################

module "network" {
  source                      = "sourcefuse/arc-network/aws"
  version                     = "2.6.1"
  namespace                   = var.namespace
  environment                 = var.environment
  availability_zones          = var.availability_zones
  vpc_ipv4_primary_cidr_block = var.vpc_ipv4_primary_cidr_block
  client_vpn_enabled          = var.client_vpn_enabled
  vpn_gateway_enabled         = var.vpn_gateway_enabled

  vpc_endpoint_config = {
    s3         = false
    kms        = false
    cloudwatch = false
    elb        = false
    dynamodb   = false
    ec2        = false
    sns        = false
    sqs        = false
    ecs        = false
    rds        = false
  }

  custom_subnets_enabled = var.custom_subnets_eanbled
  custom_private_subnets = local.private_subnets
  custom_public_subnets  = local.public_subnets

  custom_nat_gateway_enabled = var.custom_nat_gateway_enabled
  custom_az_ngw_ids          = local.custom_az_ngw_ids

  client_vpn_authorization_rules = []

  gateway_endpoint_route_table_filter = ["*private*"]

  tags = module.tags.tags
}

resource "aws_eip" "nat_eip" {

  tags = module.tags.tags
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = module.network.public_subnet_ids["${var.namespace}-${var.environment}-public-${var.region}a"]

  tags = merge({ Name = "${var.namespace}-${var.environment}-ngw" }, module.tags.tags)
}

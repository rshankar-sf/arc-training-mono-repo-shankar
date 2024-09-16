################################################################################
## defaults
################################################################################

module "arc-tags" {
  source      = "sourcefuse/arc-tags/aws"
  version     = "1.2.5"
  environment = var.environment
  project     = var.project_name

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/db"
  }
}

resource "aws_security_group" "rds-sg" {
  name        = local.security_groups["rds-sg"].name
  description = local.security_groups["rds-sg"].description
  vpc_id      = data.aws_vpc.vpc.id

  tags = module.arc-tags.tags
}

resource "aws_security_group_rule" "rds-sg-rules" {
  count = length(local.security_groups["rds-sg"].rules)

  security_group_id = aws_security_group.rds-sg.id
  type              = local.security_groups["rds-sg"].rules[count.index].type
  from_port         = local.security_groups["rds-sg"].rules[count.index].from_port
  to_port           = local.security_groups["rds-sg"].rules[count.index].to_port
  protocol          = local.security_groups["rds-sg"].rules[count.index].protocol
  cidr_blocks       = [local.security_groups["rds-sg"].rules[count.index].cidr_ipv4]
  description       = local.security_groups["rds-sg"].rules[count.index].key
}



################################################################################
## db
################################################################################
module "aurora" {
  source  = "sourcefuse/arc-db/aws"
  version = "2.0.6"

  environment = var.environment
  namespace   = var.namespace
  region      = var.region
  vpc_id      = data.aws_vpc.vpc.id

  aurora_cluster_enabled             = var.aurora_cluster_enabled
  aurora_cluster_name                = "${var.namespace}-${var.environment}-aurora"
  enhanced_monitoring_name           = "arc-dev-enhanced-monitoring-role" #"${var.namespace}-${var.environment}-enhanced-monitoring"
  aurora_db_admin_username           = var.admin_user
  aurora_db_admin_password           = var.admin_password
  aurora_db_name                     = var.aurora_cluster_name
  aurora_allow_major_version_upgrade = var.aurora_allow_major_version_upgrade
  aurora_auto_minor_version_upgrade  = var.aurora_auto_minor_version_upgrade
  aurora_cluster_size                = var.cluster_size
  aurora_instance_type               = var.aurora_instance_type
  aurora_subnets                     = data.aws_subnets.private.ids
  aurora_security_groups             = [aws_security_group.rds-sg.id]
  aurora_allowed_cidr_blocks         = [data.aws_vpc.vpc.cidr_block]

  aurora_serverlessv2_scaling_configuration = {
    max_capacity = var.max_capacity
    min_capacity = var.min_capacity
  }
  tags = merge(
    module.arc-tags.tags
  )
}

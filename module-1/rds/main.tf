# main.tf

resource "aws_security_group" "rds-sg" {
  name        = "${var.namespace}-${var.organisation}-${var.environment}-rds-sg"
  description = var.security_groups-1["rds-sg"].description
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    name = "${var.namespace}-${var.organisation}-${var.environment}-rds-sg"
  }
}

resource "aws_security_group_rule" "rds-sg-rules" {
  count = length(var.security_groups-1["rds-sg"].rules)

  security_group_id = aws_security_group.rds-sg.id
  type              = var.security_groups-1["rds-sg"].rules[count.index].type
  from_port         = var.security_groups-1["rds-sg"].rules[count.index].from_port
  to_port           = var.security_groups-1["rds-sg"].rules[count.index].to_port
  protocol          = var.security_groups-1["rds-sg"].rules[count.index].protocol
  cidr_blocks       = [var.security_groups-1["rds-sg"].rules[count.index].cidr_ipv4]
  description       = var.security_groups-1["rds-sg"].rules[count.index].key
}

# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.namespace}-${var.organisation}-${var.environment}-rds-sg-subnet-group"
  subnet_ids = data.aws_subnets.private.ids

  tags = {
    Name = "${var.namespace}-${var.organisation}-${var.environment}-rds-sg-subnet-group"
  }
}

# Generate Random Password
resource "random_password" "db_password" {
  length           = 16
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  override_special = "_-!$"
}

# Store Password in SSM Parameter Store
resource "aws_ssm_parameter" "db_password" {
  name  = "/${var.namespace}/${var.organisation}/${var.environment}/db/password"
  type  = "SecureString"
  value = random_password.db_password.result

  tags = {
    Name = "${var.namespace}-${var.organisation}-${var.environment}-db-password"
  }
}

# RDS Instance
resource "aws_db_instance" "db" {
  allocated_storage                     = var.allocated_storage
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  db_name                               = var.db_name
  username                              = var.username
  password                              = random_password.db_password.result
  parameter_group_name                  = var.parameter_group_name
  db_subnet_group_name                  = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids                = [aws_security_group.rds-sg.id]
  availability_zone                     = var.availability_zone
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  maintenance_window                    = var.maintenance_window
  multi_az                              = var.multi_az
  storage_type                          = var.storage_type
  publicly_accessible                   = var.publicly_accessible
  apply_immediately                     = var.apply_immediately
  deletion_protection                   = var.deletion_protection
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  storage_encrypted                     = var.storage_encrypted
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot

  tags = {
    Name = "${var.namespace}-${var.organisation}-${var.environment}-db"
  }

  timeouts {
    create = var.timeouts.create
    delete = var.timeouts.delete
    update = var.timeouts.update
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_alarms" {
  for_each            = var.enable_rds_alarms ? var.rds_alarms : {}
  alarm_name          = "${each.key}_${var.environment}"
  comparison_operator = each.value.comparison_operator
  evaluation_periods  = each.value.evaluation_periods
  metric_name         = each.value.metric_name
  namespace           = "AWS/RDS"
  period              = each.value.period
  statistic           = each.value.statistic
  threshold           = each.value.threshold
  alarm_description   = each.value.description
  actions_enabled     = each.value.actions_enabled
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.db.id
  }
  tags = {
    Environment = var.environment
  }
}

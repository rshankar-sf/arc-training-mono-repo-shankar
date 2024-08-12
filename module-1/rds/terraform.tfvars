namespace    = "arc-iac"
organisation = "sf"
environment  = "dev"

security_groups-1 = {
  "rds-sg" = {
    name        = "arc-iac-s-sg"
    description = "security group to allow instances to access other instances in the VPC"
    rules = [
      {
        key       = "db-in"
        type      = "ingress"
        from_port = 3542
        to_port   = 3542
        protocol  = "tcp"
        cidr_ipv4 = "0.0.0.0/0"
      },
      {
        key       = "db-out"
        type      = "egress"
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_ipv4 = "0.0.0.0/0"
      }
    ]
  }
}
db_name           = "arc-iac-sf-dev-db"
region            = "us-east-2"
allocated_storage = 20

engine                  = "postgres"
engine_version          = "15.4"
instance_class          = "db.r6g.2xlarge"
username                = "admin"
parameter_group_name    = "default.postgres15"
availability_zone       = "us-east-2a"
backup_retention_period = 7
backup_window           = "07:00-09:00"
maintenance_window      = "sun:05:00-sun:09:00"
multi_az                = false
storage_type            = "gp2"

publicly_accessible = false
apply_immediately   = true
deletion_protection = true

performance_insights_enabled          = true
performance_insights_retention_period = 7
storage_encrypted                     = true
copy_tags_to_snapshot                 = true

timeouts = {
  create = "30m"
  delete = "30m"
  update = "30m"
}

enable_rds_alarms = true

rds_alarms = {
  burst_balance_too_low = {
    metric_name         = "BurstBalance"
    comparison_operator = "LessThanThreshold"
    threshold           = 20
    evaluation_periods  = 1
    period              = 600
    statistic           = "Average"
    description         = "Average database storage burst balance too low"
    actions_enabled     = true
  },
  cpu_utilization_too_high = {
    metric_name         = "CPUUtilization"
    comparison_operator = "GreaterThanThreshold"
    threshold           = 80
    evaluation_periods  = 1
    period              = 600
    statistic           = "Average"
    description         = "Average database CPU utilization too high"
    actions_enabled     = true
  }
}

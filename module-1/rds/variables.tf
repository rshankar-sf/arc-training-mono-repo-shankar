
variable "region" {
  description = "region name"
  type        = string
}

variable "namespace" {
  description = "name of the namespace"
  type        = string
}

variable "organisation" {
  description = "name of the oraganisation"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "db_name" {
  description = "name of the db_name"
  type        = string
}


variable "security_groups-1" {
  description = "Map of security group configurations"
  type = map(object({
    name        = string
    description = string
    rules = list(object({
      key       = string
      type      = string
      from_port = number
      to_port   = number
      protocol  = string
      cidr_ipv4 = string
    }))
  }))
}


variable "allocated_storage" {
  description = "The allocated storage size for the RDS instance"
  type        = number
}

# variable "max_allocated_storage" {
#   description = "The maximum storage size for the RDS instance"
#   type        = number
# }

variable "engine" {
  description = "The database engine to use for the RDS instance"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "parameter_group_name" {
  description = "The DB parameter group name"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the RDS instance"
  type        = string
}

variable "backup_retention_period" {
  description = "The backup retention period for the RDS instance"
  type        = number
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
}

variable "maintenance_window" {
  description = "The window during which maintenance is performed on the RDS instance"
  type        = string
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}

variable "storage_type" {
  description = "The storage type to be associated with the RDS instance"
  type        = string
}

# variable "iops" {
#   description = "The amount of provisioned IOPS for the RDS instance"
#   type        = number
# }

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
}

variable "apply_immediately" {
  description = "Whether to apply modifications immediately"
  type        = bool
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection for the RDS instance"
  type        = bool
}

# variable "monitoring_interval" {
#   description = "The interval in seconds between Enhanced Monitoring metrics"
#   type        = number
# }

variable "performance_insights_enabled" {
  description = "Whether to enable Performance Insights for the RDS instance"
  type        = bool
}

variable "performance_insights_retention_period" {
  description = "The number of days to retain Performance Insights data"
  type        = number
}

variable "storage_encrypted" {
  description = "Whether to enable storage encryption"
  type        = bool
}

variable "copy_tags_to_snapshot" {
  description = "Whether to copy tags to snapshots"
  type        = bool
}

variable "timeouts" {
  description = "Timeout configurations for the RDS instance"
  type = object({
    create = string
    delete = string
    update = string
  })
}

variable "rds_alarms" {
  description = "Map of RDS CloudWatch alarms to create"
  type = map(object({
    metric_name         = string
    comparison_operator = string
    threshold           = number
    evaluation_periods  = number
    period              = number
    statistic           = string
    description         = string
    actions_enabled     = bool
  }))
  default = {}
}


variable "enable_rds_alarms" {
  description = "if we need to create a alarm"
  type        = bool
}

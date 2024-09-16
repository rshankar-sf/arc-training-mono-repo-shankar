
variable "region" {
  description = "name of the region"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, stage, prod)"
  type        = string
}

variable "namespace" {
  description = "Project name"
  type        = string
}

variable "organisation" {
  description = "name of the organisation"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "instance_tenancy" {
  description = "The tenancy option for instances launched into the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
}

variable "enable_network_address_usage_metrics" {
  description = "Enable network address usage metrics"
  type        = bool
}

variable "public_subnets" {
  description = "A map of public subnet attributes"
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    name                    = string
  }))
}

variable "private_subnets" {
  description = "A map of private subnet attributes"
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    name                    = string
  }))
}

variable "security_groups" {
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


variable "ami" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address"
  type        = bool
}

variable "root_volume_type" {
  description = "Type of root volume (gp3, gp2, etc.)"
  type        = string
}

variable "root_volume_size" {
  description = "Size of the root volume in GiB"
  type        = number
}

variable "root_volume_iops" {
  description = "IOPS for the root volume"
  type        = number
}

variable "root_volume_throughput" {
  description = "Throughput for the root volume in MiB/s"
  type        = number
}

variable "ebs_device_name" {
  description = "Device name for the additional EBS volume"
  type        = string
}

variable "ebs_volume_type" {
  description = "Type of additional EBS volume"
  type        = string
}

variable "ebs_volume_size" {
  description = "Size of the additional EBS volume in GiB"
  type        = number
}

variable "ebs_volume_iops" {
  description = "IOPS for the additional EBS volume"
  type        = number
}

variable "ebs_volume_throughput" {
  description = "Throughput for the additional EBS volume in MiB/s"
  type        = number
}

variable "ebs_encrypted" {
  description = "Whether the additional EBS volume should be encrypted"
  type        = bool
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}


variable "disable_api_termination" {
  description = "Whether to disable API termination"
  type        = bool
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior (stop or terminate)"
  type        = string
}

variable "monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
}

variable "cpu_credits" {
  description = "Credit specification for burstable instances (standard or unlimited)"
  type        = string
}


variable "ebs_optimized" {
  description = "Whether the instance is EBS-optimized"
  type        = bool
}

variable "tenancy" {
  description = "Tenancy option (default, dedicated, or host)"
  type        = string
}

variable "metadata_http_endpoint" {
  description = "Enable or disable metadata service"
  type        = string
}

variable "metadata_http_tokens" {
  description = "Require tokens for metadata service"
  type        = string
}

variable "metadata_http_put_response_hop_limit" {
  description = "Hop limit for PUT requests to the metadata service"
  type        = number
}

variable "user_data" {
  description = "User data script to be run at instance launch"
  type        = string
}

variable "tls_algorithm" {
  description = "The algorithm to use for the TLS private key."
  type        = string
}

variable "tls_rsa_bits" {
  description = "The number of bits in the RSA key."
  type        = number
}

###########################################################################

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

variable "db_name" {
  description = "name of the db_name"
  type        = string
}


variable "allocated_storage" {
  description = "The allocated storage size for the RDS instance"
  type        = number
}


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
  description = "Flag to determine if RDS alarms should be created"
  type        = bool
  default     = false
}

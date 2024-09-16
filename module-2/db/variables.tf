variable "db_admin_username" {
  type        = string
  default     = "db_admin"
  description = "Name of the default DB admin user role"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "project_name" {
  type        = string
  description = "name of the project"
}

variable "cluster_size" {
  type        = number
  default     = 0
  description = "Number of DB instances to create in the cluster"
}

variable "environment" {
  type        = string
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
}

variable "aurora_cluster_name" {
  type        = string
  default     = "arc"
  description = <<-EOT
    ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.
    This is the only ID element not also included as a `tag`.
    The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input.
    EOT
}

variable "admin_user" {
  type        = string
  description = "Username for the master DB user. Ignored if snapshot_identifier or replication_source_identifier is provided"
}

variable "admin_password" {
  type        = string
  description = "Password for the master DB user. Ignored if snapshot_identifier or replication_source_identifier is provided"
}

variable "max_capacity" {
  type        = number
  description = "Number of max_capacity"
}

variable "min_capacity" {
  type        = number
  description = "Number of min_capacity"
}

variable "aurora_cluster_enabled" {
  type        = bool
  description = "enabled or disabled aurora_cluster_enabled"
}

variable "aurora_allow_major_version_upgrade" {
  type        = bool
  description = "enabled or disabled aurora_allow_major_version_upgrade"
}

variable "aurora_auto_minor_version_upgrade" {
  type        = bool
  description = "enabled or disabled aurora_auto_minor_version_upgrade"
}

variable "aurora_instance_type" {
  type        = string
  description = "instance aurora_instance_type "
}

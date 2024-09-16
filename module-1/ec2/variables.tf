variable "region" {
  description = "name of the region"
  type        = string
}

variable "namespace" {
  description = "Project name"
  type        = string
}

variable "organisation" {
  description = "Organization name"
  type        = string
}


variable "environment" {
  description = "Environment for the deployment (e.g., development, staging, production)"
  type        = string
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

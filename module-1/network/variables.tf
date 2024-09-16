variable "environment" {
  description = "Environment name (e.g. dev, stage, prod)"
  type        = string
}

variable "namespace" {
  description = "Project name"
  type        = string
}

variable "region" {
  description = "name of the region"
  type        = string
}

variable "organisation" {
  description = "name of the organisation"
  type        = string
}


variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "Instance tenancy for the VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
}

variable "enable_network_address_usage_metrics" {
  type        = bool
  description = "Enable network address usage metrics"
}


variable "public_subnets" {
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    name                    = string
  }))
  description = "Mapping of public subnets with properties"
}

variable "private_subnets" {
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    name                    = string
  }))
  description = "Mapping of private subnets with properties"
}

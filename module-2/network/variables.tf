################################################################
## shared
################################################################
variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "environment" {
  type        = string
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

################################################################
## networking
################################################################
variable "availability_zones" {
  description = "List of availability zones to deploy resources in."
  type        = list(string)
}

variable "vpc_ipv4_primary_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "client_vpn_enabled" {
  description = "Enable or disable Client Vpn"
  type        = bool
}

variable "vpn_gateway_enabled" {
  description = "Enable or disable VPN Gateway"
  type        = bool
}

variable "custom_subnets_eanbled" {
  description = "Enable or disable custom_subnets_enabled"
  type        = bool
}

variable "custom_nat_gateway_enabled" {
  description = "Enable or disable custom_nat_gateway_enabled "
  type        = bool
}

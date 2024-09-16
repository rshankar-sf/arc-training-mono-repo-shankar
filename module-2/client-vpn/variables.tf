################################################################################
## shared
################################################################################
variable "region" {
  type        = string
  description = "AWS region"
}

variable "namespace" {
  type        = string
  description = "Namespace to assign the resources"
}

################################################################################
## lookups
################################################################################
################################################################################
## certs
################################################################################
variable "secret_path_format" {
  description = "The path format to use when writing secrets to the certificate backend."
  type        = string
  default     = "/%s.%s"

  validation {
    condition     = can(substr(var.secret_path_format, 0, 1) == "/")
    error_message = "The secret path format must contain a leading slash."
  }
}

################################################################################
## vpn
################################################################################
variable "environment" {
  description = "Name of the environment the resource belongs to."
  type        = string

}

variable "project_name" {
  description = "Name of the project the vpn resource belongs to."
  type        = string
}


variable "client_cidr" {
  description = "Name of the project the vpn resource belongs to."
  type        = string
}

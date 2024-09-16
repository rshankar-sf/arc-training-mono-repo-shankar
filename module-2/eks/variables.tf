################################################################
## shared
################################################################
variable "namespace" {
  description = "Namespace for the resources."
  type        = string
}


variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  type        = string
  description = "name of the project"
}

#######################################################
## eks / kubernetes / helm
#######################################################

variable "kubernetes_version" {
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used"
  type        = string
}

variable "instance_types" {
  description = "Set of instance types associated with the EKS Node Group"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "The minimum size of the AutoScaling Group."
  type        = number
}

variable "max_size" {
  description = "The maximum size of the AutoScaling Group."
  type        = number
}


#######################################################
## data lookups
#######################################################

variable "environment" {
  description = "ID element. Usually used for region or role"
  type        = string
}

variable "kubernetes_namespace" {
  description = "Default k8s namespace to create"
  type        = string
}

variable "create_node_group" {
  description = "Flag to create node group for EKS"
  type        = bool
}

variable "enabled" {
  description = "Enable or disable the EKS cluster"
  type        = bool
}

variable "apply_config_map_aws_auth" {
  description = "Apply the aws-auth config map to the EKS cluster"
  type        = bool
}

variable "kube_data_auth_enabled" {
  description = "Enable data authentication for Kubernetes"
  type        = bool
}

variable "kube_exec_auth_enabled" {
  description = "Enable exec authentication for Kubernetes"
  type        = bool
}

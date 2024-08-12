# Terraform AWS Infrastructure

This Terraform configuration sets up AWS infrastructure components including networking, EC2 instances, and RDS databases. 

## Overview

This project is organized into modules for better reusability and separation of concerns. The primary components are:

- **Network Module**: Configures VPC, subnets, internet gateway, and NAT gateway.
- **EC2 Module**: Manages EC2 instances including security groups and volume settings.
- **RDS Module**: Sets up RDS databases with security groups and backup settings.

## Modules

### Network Module

The Network module sets up the VPC, subnets, and networking resources.

**Configuration (`module "network"`):**

```hcl
module "network" {
  source = "../network"

  region                                = var.region
  vpc_cidr_block                        = var.vpc_cidr_block
  instance_tenancy                      = var.instance_tenancy
  enable_dns_support                    = var.enable_dns_support
  enable_dns_hostnames                  = var.enable_dns_hostnames
  enable_network_address_usage_metrics  = var.enable_network_address_usage_metrics
  public_subnets                        = var.public_subnets
  private_subnets                       = var.private_subnets
  namespace                             = var.namespace
  organisation                          = var.organisation
  environment                           = var.environment
}

### **EC2 Module**
The EC2 module provisions EC2 instances with various configuration options.

module "ec2" {
  source = "../ec2"

  region                                = var.region          
  security_groups                       = var.security_groups
  ami                                   = var.ami
  instance_type                         = var.instance_type
  key_name                              = var.key_name
  namespace                             = var.namespace
  organisation                          = var.organisation
  environment                           = var.environment
  root_volume_type                      = var.root_volume_type
  root_volume_size                      = var.root_volume_size
  root_volume_iops                      = var.root_volume_iops
  root_volume_throughput                = var.root_volume_throughput
  ebs_device_name                       = var.ebs_device_name
  ebs_volume_type                       = var.ebs_volume_type
  ebs_volume_size                       = var.ebs_volume_size
  ebs_volume_iops                       = var.ebs_volume_iops
  ebs_volume_throughput                 = var.ebs_volume_throughput
  ebs_encrypted                         = var.ebs_encrypted
  iam_instance_profile                  = var.iam_instance_profile
  associate_public_ip_address           = var.associate_public_ip_address
  disable_api_termination               = var.disable_api_termination
  instance_initiated_shutdown_behavior  = var.instance_initiated_shutdown_behavior
  monitoring                            = var.monitoring
  cpu_credits                           = var.cpu_credits
  ebs_optimized                         = var.ebs_optimized
  tenancy                               = var.tenancy
  metadata_http_endpoint                = var.metadata_http_endpoint
  metadata_http_tokens                  = var.metadata_http_tokens
  metadata_http_put_response_hop_limit  = var.metadata_http_put_response_hop_limit
  user_data                             = var.user_data
  tls_algorithm                         = var.tls_algorithm
  tls_rsa_bits                          = var.tls_rsa_bits
}


**RDS Module**
The RDS module configures the RDS database instances and related settings.

module "rds" {
  source = "../rds"

  db_name                                 = var.db_name  
  namespace                               = var.namespace
  organisation                            = var.organisation
  environment                             = var.environment
  region                                  = var.region
  security_groups-1                       = var.security_groups-1
  allocated_storage                       = var.allocated_storage
  engine                                  = var.engine
  engine_version                          = var.engine_version
  instance_class                          = var.instance_class
  username                                = var.username
  parameter_group_name                    = var.parameter_group_name
  availability_zone                       = var.availability_zone
  backup_retention_period                 = var.backup_retention_period
  backup_window                           = var.backup_window
  maintenance_window                      = var.maintenance_window
  multi_az                                = var.multi_az
  storage_type                            = var.storage_type
  publicly_accessible                     = var.publicly_accessible
  apply_immediately                       = var.apply_immediately
  deletion_protection                     = var.deletion_protection
  performance_insights_enabled            = var.performance_insights_enabled
  performance_insights_retention_period   = var.performance_insights_retention_period
  storage_encrypted                       = var.storage_encrypted
  copy_tags_to_snapshot                   = var.copy_tags_to_snapshot

  timeouts                                = var.timeouts

  enable_rds_alarms                       = var.enable_rds_alarms
  rds_alarms                              = var.rds_alarms
}

**Outputs**
The following outputs are available:

Network Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.network.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.network.public_subnet_ids
}

output "public_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the public subnets"
  value       = module.network.public_subnet_cidr_blocks
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.network.private_subnet_ids
}

output "private_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the private subnets"
  value       = module.network.private_subnet_cidr_blocks
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.network.internet_gateway_id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.network.nat_gateway_id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = module.network.public_route_table_id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = module.network.private_route_table_id
}

**EC2 Outputs**
output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "The public IP of the EC2 instance."
  value       = module.ec2.public_ip
}

output "private_ip" {
  description = "The private IP of the EC2 instance."
  value       = module.ec2.private_ip
}


**
RDS Outputs**
output "rds_security_group_id" {
  description = "The ID of the RDS security group"
  value       = module.rds.rds_security_group_id
}

output "rds_db_subnet_group_name" {
  description = "The name of the RDS DB Subnet Group"
  value       = module.rds.rds_db_subnet_group_name
}

output "rds_instance_id" {
  description = "The ID of the RDS DB instance"
  value       = module.rds.rds_instance_id
}

output "rds_instance_endpoint" {
  description = "The endpoint of the RDS DB instance"
  value       = module.rds.rds_instance_endpoint
}

output "rds_instance_arn" {
  description = "The ARN of the RDS DB instance"
  value       = module.rds.rds_instance_arn
}

output "rds_db_password_ssm_param_name" {
  description = "The name of the SSM parameter storing the RDS DB password"
  value       = module.rds.rds_db_password_ssm_param_name
}

output "rds_cloudwatch_alarms" {
  description = "A map of CloudWatch alarms created for the RDS instance"
  value       = module.rds.rds_cloudwatch_alarms
}


**Variables**
Ensure that you define all required variables in your variables.tf file or through a terraform.tfvars file.



**Usage**
Initialize the Terraform workspace:
terraform init

Plan the infrastructure changes:
terraform plan

Apply the configuration:
terraform apply

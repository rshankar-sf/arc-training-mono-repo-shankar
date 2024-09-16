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

###########################################################################
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

##############################################################################

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

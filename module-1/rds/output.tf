output "rds_security_group_id" {
  description = "The ID of the RDS security group"
  value       = aws_security_group.rds-sg.id
}

output "rds_db_subnet_group_name" {
  description = "The name of the RDS DB Subnet Group"
  value       = aws_db_subnet_group.rds_subnet_group.name
}

output "rds_instance_id" {
  description = "The ID of the RDS DB instance"
  value       = aws_db_instance.db.id
}

output "rds_instance_endpoint" {
  description = "The endpoint of the RDS DB instance"
  value       = aws_db_instance.db.endpoint
}

output "rds_instance_arn" {
  description = "The ARN of the RDS DB instance"
  value       = aws_db_instance.db.arn
}

output "rds_db_password_ssm_param_name" {
  description = "The name of the SSM parameter storing the RDS DB password"
  value       = aws_ssm_parameter.db_password.name
}

output "rds_cloudwatch_alarms" {
  description = "A map of CloudWatch alarms created for the RDS instance"
  value       = { for alarm_name, alarm in aws_cloudwatch_metric_alarm.rds_alarms : alarm_name => alarm.id }
}

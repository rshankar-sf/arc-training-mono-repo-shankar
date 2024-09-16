################################################################################
## Service Roles
################################################################################
output "service_role_arn" {
  description = "The ARNs of the IAM roles created by the aws_iam_role.github_oidc resource block."
  value       = module.github_iam.role_arn
}

output "service_role_name" {
  description = "The names of the IAM roles created by the aws_iam_role.github_oidc resource block."
  value       = module.github_iam.role_name
}

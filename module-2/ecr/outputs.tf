################################################################################
## Output for ECR repositories
################################################################################

# Output the ECR repository URLs
output "ecr_repository_urls" {
  description = "The URLs of the ECR repositories"
  value       = { for repo, ecr in module.ecr : repo => ecr.repository_url }
}

# Output the ECR repository ARNs
output "ecr_repository_arns" {
  description = "The ARNs of the ECR repositories"
  value       = { for repo, ecr in module.ecr : repo => ecr.repository_arn }
}

# Output the ECR repository names
output "ecr_repository_names" {
  description = "The names of the ECR repositories"
  value       = { for repo, ecr in module.ecr : repo => ecr.repository_name }
}

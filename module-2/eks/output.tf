# Output the EKS Cluster ID
output "eks_cluster_id" {
  description = "The ID of the EKS cluster."
  value       = module.eks_cluster.eks_cluster_id
}

# Output the EKS Cluster Security Group ID
output "eks_security_group_id" {
  description = "The ID of the EKS cluster security group."
  value       = aws_security_group.eks-sg.id
}


# Output the private subnet IDs used by the EKS cluster
output "eks_private_subnet_ids" {
  description = "The private subnet IDs used by the EKS cluster."
  value       = data.aws_subnets.private.ids
}

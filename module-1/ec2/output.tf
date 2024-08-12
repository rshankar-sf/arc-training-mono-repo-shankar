output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.arc-ec2.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance."
  value       = aws_instance.arc-ec2.public_ip
}

output "private_ip" {
  description = "The private IP of the EC2 instance."
  value       = aws_instance.arc-ec2.private_ip
}

output "vpn_endpoint_dns_name" {
  value       = module.network.vpn_endpoint_dns_name
  description = "The DNS Name of the Client VPN Endpoint Connection."
}

output "public_subnet_ids" {
  value       = module.network.public_subnet_ids
  description = "public subnets per az"
}

output "private_subnet_ids" {
  value       = module.network.private_subnet_ids
  description = "private subnets per availibility zones"
}

# Example outputs based on common outputs in a network module
output "nat_eip_id" {
  description = "The ID of the Elastic IP associated with the NAT Gateway"
  value       = aws_eip.nat_eip.id
}

output "nat_eip_address" {
  description = "The Elastic IP address associated with the NAT Gateway"
  value       = aws_eip.nat_eip.public_ip
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.example.id
}

output "nat_gateway_subnet_id" {
  description = "The subnet ID where the NAT Gateway is located"
  value       = aws_nat_gateway.example.subnet_id
}

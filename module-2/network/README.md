# Reference Architecture DevOps Infrastructure: [VPC](https://sourcefuse.github.io/arc-docs/arc-iac-docs/modules/terraform-aws-ref-arch-network/)  

## Overview

AWS VPC for the SourceFuse DevOps Reference Architecture Infrastructure.  

![Module Structure](./static/arc_network_hla.png)

## Usage
1. Initialize the backend:
  ```shell
  terraform init -backend-config config.dev.hcl
  ```
2. Create a `dev` workspace
  ```shell
  terraform workspace new dev
  ```
3. Plan Terraform
  ```shell
  terraform plan -var-file dev.tfvars
  ```
4. Apply Terraform
  ```shell
  terraform apply -var-file dev.tfvars
  ```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_awsutils"></a> [awsutils](#requirement\_awsutils) | ~> 0.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | sourcefuse/arc-network/aws | 2.6.1 |
| <a name="module_tags"></a> [tags](#module\_tags) | sourcefuse/arc-tags/aws | 1.2.5 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_nat_gateway.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones to deploy resources in. | `list(string)` | n/a | yes |
| <a name="input_client_vpn_enabled"></a> [client\_vpn\_enabled](#input\_client\_vpn\_enabled) | Enable or disable Client Vpn | `bool` | n/a | yes |
| <a name="input_custom_nat_gateway_enabled"></a> [custom\_nat\_gateway\_enabled](#input\_custom\_nat\_gateway\_enabled) | Enable or disable custom\_nat\_gateway\_enabled | `bool` | n/a | yes |
| <a name="input_custom_subnets_eanbled"></a> [custom\_subnets\_eanbled](#input\_custom\_subnets\_eanbled) | Enable or disable custom\_subnets\_enabled | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the resources. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_vpc_ipv4_primary_cidr_block"></a> [vpc\_ipv4\_primary\_cidr\_block](#input\_vpc\_ipv4\_primary\_cidr\_block) | CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_vpn_gateway_enabled"></a> [vpn\_gateway\_enabled](#input\_vpn\_gateway\_enabled) | Enable or disable VPN Gateway | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_eip_address"></a> [nat\_eip\_address](#output\_nat\_eip\_address) | The Elastic IP address associated with the NAT Gateway |
| <a name="output_nat_eip_id"></a> [nat\_eip\_id](#output\_nat\_eip\_id) | The ID of the Elastic IP associated with the NAT Gateway |
| <a name="output_nat_gateway_id"></a> [nat\_gateway\_id](#output\_nat\_gateway\_id) | The ID of the NAT Gateway |
| <a name="output_nat_gateway_subnet_id"></a> [nat\_gateway\_subnet\_id](#output\_nat\_gateway\_subnet\_id) | The subnet ID where the NAT Gateway is located |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | private subnets per availibility zones |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | public subnets per az |
| <a name="output_vpn_endpoint_dns_name"></a> [vpn\_endpoint\_dns\_name](#output\_vpn\_endpoint\_dns\_name) | The DNS Name of the Client VPN Endpoint Connection. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

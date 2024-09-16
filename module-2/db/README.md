# Reference Architecture DevOps Infrastructure: [Database](https://sourcefuse.github.io/arc-docs/arc-iac-docs/modules/terraform-aws-ref-arch-db/)

## Overview

AWS RDS/Aurora for the SourceFuse DevOps Reference Architecture Infrastructure.  

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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_arc-tags"></a> [arc-tags](#module\_arc-tags) | sourcefuse/arc-tags/aws | 1.2.5 |
| <a name="module_aurora"></a> [aurora](#module\_aurora) | sourcefuse/arc-db/aws | 2.0.6 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.rds-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.rds-sg-rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Password for the master DB user. Ignored if snapshot\_identifier or replication\_source\_identifier is provided | `string` | n/a | yes |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | Username for the master DB user. Ignored if snapshot\_identifier or replication\_source\_identifier is provided | `string` | n/a | yes |
| <a name="input_aurora_allow_major_version_upgrade"></a> [aurora\_allow\_major\_version\_upgrade](#input\_aurora\_allow\_major\_version\_upgrade) | enabled or disabled aurora\_allow\_major\_version\_upgrade | `bool` | n/a | yes |
| <a name="input_aurora_auto_minor_version_upgrade"></a> [aurora\_auto\_minor\_version\_upgrade](#input\_aurora\_auto\_minor\_version\_upgrade) | enabled or disabled aurora\_auto\_minor\_version\_upgrade | `bool` | n/a | yes |
| <a name="input_aurora_cluster_enabled"></a> [aurora\_cluster\_enabled](#input\_aurora\_cluster\_enabled) | enabled or disabled aurora\_cluster\_enabled | `bool` | n/a | yes |
| <a name="input_aurora_cluster_name"></a> [aurora\_cluster\_name](#input\_aurora\_cluster\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `"arc"` | no |
| <a name="input_aurora_instance_type"></a> [aurora\_instance\_type](#input\_aurora\_instance\_type) | instance aurora\_instance\_type | `string` | n/a | yes |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Number of DB instances to create in the cluster | `number` | `0` | no |
| <a name="input_db_admin_username"></a> [db\_admin\_username](#input\_db\_admin\_username) | Name of the default DB admin user role | `string` | `"db_admin"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | n/a | yes |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | Number of max\_capacity | `number` | n/a | yes |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Number of min\_capacity | `number` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the resources. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | name of the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aurora_arn"></a> [aurora\_arn](#output\_aurora\_arn) | Amazon Resource Name (ARN) of cluster |
| <a name="output_aurora_endpoint"></a> [aurora\_endpoint](#output\_aurora\_endpoint) | The DNS address of the Aurora instance |
| <a name="output_db_admin_username"></a> [db\_admin\_username](#output\_db\_admin\_username) | DB Admin username to the SQL Server |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

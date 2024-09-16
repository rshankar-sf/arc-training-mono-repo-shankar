module "network" {
  source = "../network"

  region                               = var.region
  vpc_cidr_block                       = var.vpc_cidr_block
  instance_tenancy                     = var.instance_tenancy
  enable_dns_support                   = var.enable_dns_support
  enable_dns_hostnames                 = var.enable_dns_hostnames
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  public_subnets                       = var.public_subnets
  private_subnets                      = var.private_subnets
  namespace                            = var.namespace
  organisation                         = var.organisation
  environment                          = var.environment
}


##########################################################################################################

module "ec2" {
  source = "../ec2"

  region          = var.region
  security_groups = var.security_groups

  ami                                  = var.ami
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  namespace                            = var.namespace
  organisation                         = var.organisation
  environment                          = var.environment
  root_volume_type                     = var.root_volume_type
  root_volume_size                     = var.root_volume_size
  root_volume_iops                     = var.root_volume_iops
  root_volume_throughput               = var.root_volume_throughput
  ebs_device_name                      = var.ebs_device_name
  ebs_volume_type                      = var.ebs_volume_type
  ebs_volume_size                      = var.ebs_volume_size
  ebs_volume_iops                      = var.ebs_volume_iops
  ebs_volume_throughput                = var.ebs_volume_throughput
  ebs_encrypted                        = var.ebs_encrypted
  iam_instance_profile                 = var.iam_instance_profile
  associate_public_ip_address          = var.associate_public_ip_address
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  monitoring                           = var.monitoring
  cpu_credits                          = var.cpu_credits
  ebs_optimized                        = var.ebs_optimized
  tenancy                              = var.tenancy
  metadata_http_endpoint               = var.metadata_http_endpoint
  metadata_http_tokens                 = var.metadata_http_tokens
  metadata_http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
  user_data                            = var.user_data
  tls_algorithm                        = var.tls_algorithm
  tls_rsa_bits                         = var.tls_rsa_bits
}


#############################################################################################3

module "rds" {
  source = "../rds"


  db_name                               = var.db_name
  namespace                             = var.namespace
  organisation                          = var.organisation
  environment                           = var.environment
  region                                = var.region
  security_groups-1                     = var.security_groups-1
  allocated_storage                     = var.allocated_storage
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  username                              = var.username
  parameter_group_name                  = var.parameter_group_name
  availability_zone                     = var.availability_zone
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  maintenance_window                    = var.maintenance_window
  multi_az                              = var.multi_az
  storage_type                          = var.storage_type
  publicly_accessible                   = var.publicly_accessible
  apply_immediately                     = var.apply_immediately
  deletion_protection                   = var.deletion_protection
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  storage_encrypted                     = var.storage_encrypted
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot

  timeouts = var.timeouts

  enable_rds_alarms = var.enable_rds_alarms
  rds_alarms        = var.rds_alarms
}

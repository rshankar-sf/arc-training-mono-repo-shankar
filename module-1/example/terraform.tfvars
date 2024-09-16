
region                               = "us-east-2"
namespace                            = "arc-iac"
organisation                         = "sf"
environment                          = "dev"
vpc_cidr_block                       = "10.0.0.0/16"
instance_tenancy                     = "default"
enable_dns_support                   = true
enable_dns_hostnames                 = true
enable_network_address_usage_metrics = false


public_subnets = {
  "subnet-public-1" = {
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-2a"
    map_public_ip_on_launch = true
    name                    = "arc-iac-san-public-subnet-1"
  },
  "subnet-public-2" = {
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "us-east-2b"
    map_public_ip_on_launch = true
    name                    = "arc-iac-san-public-subnet-2"
  }
}

private_subnets = {
  "subnet-private-1" = {
    cidr_block              = "10.0.3.0/24"
    availability_zone       = "us-east-2a"
    map_public_ip_on_launch = false
    name                    = "arc-iac-san-private-subnet-1"
  },
  "subnet-private-2" = {
    cidr_block              = "10.0.4.0/24"
    availability_zone       = "us-east-2b"
    map_public_ip_on_launch = false
    name                    = "arc-iac-san-private-subnet-2"
  }
}



###################################################################################################

security_groups = {
  "ec2-sg" = {
    name        = "arc-iac-san-ec2-sg"
    description = "security group to allow instances to access other instances in the VPC"
    rules = [
      {
        key       = "ssh-in"
        type      = "ingress"
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_ipv4 = "0.0.0.0/0"
      },
      {
        key       = "ssh-out"
        type      = "egress"
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_ipv4 = "0.0.0.0/0"
      }
    ]
  }
}

tls_algorithm                        = "RSA"
tls_rsa_bits                         = 4096
ami                                  = "ami-05c3dc660cb6907f0"
instance_type                        = "t2.xlarge"
key_name                             = "suryasan-arc"
associate_public_ip_address          = true
root_volume_type                     = "gp3"
root_volume_size                     = 30
root_volume_iops                     = 3000
root_volume_throughput               = 125
ebs_device_name                      = "/dev/sdb"
ebs_volume_type                      = "gp3"
ebs_volume_size                      = 100
ebs_volume_iops                      = 3000
ebs_volume_throughput                = 125
ebs_encrypted                        = true
iam_instance_profile                 = "AmazonSSMRoleForInstancesQuickSetup"
disable_api_termination              = false
instance_initiated_shutdown_behavior = "stop"
monitoring                           = true
cpu_credits                          = "unlimited"
ebs_optimized                        = true
tenancy                              = "default"
metadata_http_endpoint               = "enabled"
metadata_http_tokens                 = "required"
metadata_http_put_response_hop_limit = 2
user_data                            = <<-EOF
#!/bin/bash
echo "Hello, World" > /var/tmp/hello.txt
EOF

#################################################################

security_groups-1 = {
  "rds-sg" = {
    name        = "arc-iac-s-sg"
    description = "Security group to allow instances to access other instances in the VPC"
    rules = [
      {
        key       = "db-in"
        type      = "ingress"
        from_port = 3542
        to_port   = 3542
        protocol  = "tcp"
        cidr_ipv4 = "0.0.0.0/0"
      },
      {
        key       = "db-out"
        type      = "egress"
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_ipv4 = "0.0.0.0/0"
      }
    ]
  }
}


db_name                               = "arcdb"
allocated_storage                     = 20
engine                                = "postgres"
engine_version                        = "16.2"
instance_class                        = "db.t4g.micro"
username                              = "dbadmin"
parameter_group_name                  = "default.postgres16"
availability_zone                     = "us-east-2a"
backup_retention_period               = 7
backup_window                         = "07:00-09:00"
maintenance_window                    = "sun:10:00-sun:11:00"
multi_az                              = false
storage_type                          = "gp3"
publicly_accessible                   = false
apply_immediately                     = true
deletion_protection                   = true
performance_insights_enabled          = true
performance_insights_retention_period = 7
storage_encrypted                     = true
copy_tags_to_snapshot                 = true

timeouts = {
  create = "30m"
  delete = "30m"
  update = "30m"
}

enable_rds_alarms = true

rds_alarms = {
  burst_balance_too_low = {
    metric_name         = "BurstBalance"
    comparison_operator = "LessThanThreshold"
    threshold           = 20
    evaluation_periods  = 1
    period              = 600
    statistic           = "Average"
    description         = "Average database storage burst balance too low"
    actions_enabled     = true
  },
  cpu_utilization_too_high = {
    metric_name         = "CPUUtilization"
    comparison_operator = "GreaterThanThreshold"
    threshold           = 80
    evaluation_periods  = 1
    period              = 600
    statistic           = "Average"
    description         = "Average database CPU utilization too high"
    actions_enabled     = true
  }
}

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
region                               = "us-east-2"
namespace                            = "arc-iac"
organisation                         = "sf"
environment                          = "dev"
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

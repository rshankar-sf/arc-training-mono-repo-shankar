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


locals {
  security_groups = {
    "eks-sg" = {
      name        = "${var.namespace}-${var.environment}-eks-sg"
      description = "Allow 443 from all addresses for web server"
      rules = [
        {
          key       = "eks-access"
          type      = "ingress"
          from_port = 443
          to_port   = 443
          protocol  = "tcp"
          cidr_ipv4 = data.aws_vpc.vpc.cidr_block
        },
        {
          key       = "eks-access"
          type      = "ingress"
          from_port = 10250
          to_port   = 10250
          protocol  = "tcp"
          cidr_ipv4 = data.aws_vpc.vpc.cidr_block
        },
        {
          key       = ""
          type      = "egress"
          from_port = 0
          to_port   = 0
          protocol  = "-1"
          cidr_ipv4 = "0.0.0.0/0"
        }
      ]
    }
  }
}

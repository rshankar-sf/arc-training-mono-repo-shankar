
locals {
  security_groups = {
    "rds-sg" = {
      name        = "${var.namespace}-${var.environment}-rds-sg"
      description = "Allow 443 from all addresses for web server"
      rules = [
        {
          key       = "db-access"
          type      = "ingress"
          from_port = 5432
          to_port   = 5432
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

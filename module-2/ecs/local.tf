locals {
  route_53_zone       = trimprefix(var.acm_domain_name, "*.")
  health_check_domain = "healthcheck-${var.namespace}-${var.environment}.${local.route_53_zone}"
}


data "aws_route53_zone" "default" {
  name = local.route_53_zone
}

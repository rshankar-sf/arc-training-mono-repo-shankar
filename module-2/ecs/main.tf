################################################################################
## defaults
################################################################################

module "arc-tags" {
  source      = "sourcefuse/arc-tags/aws"
  version     = "1.2.5"
  environment = var.environment
  project     = var.project_name

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/ecs"
  }
}

################################################################################
## ecs
################################################################################
module "ecs" {
  source  = "sourcefuse/arc-ecs/aws"
  version = "1.5.8"

  environment = var.environment
  namespace   = var.namespace

  vpc_id                  = data.aws_vpc.vpc.id
  alb_subnet_ids          = data.aws_subnets.public.ids
  health_check_subnet_ids = data.aws_subnets.private.ids

  # Devs: DO NOT override, otherwise tests will fail #
  access_logs_enabled                             = false
  alb_access_logs_s3_bucket_force_destroy         = true
  alb_access_logs_s3_bucket_force_destroy_enabled = true
  # -------------------------- END ------------------------- #

  # create acm certificate and dns record for health check #
  # route_53_zone                 = local.route_53_zone
  route_53_zone_name            = data.aws_route53_zone.default.name
  create_acm_certificate        = true
  route_53_zone_id              = data.aws_route53_zone.default.zone_id
  acm_domain_name               = var.acm_domain_name
  acm_subject_alternative_names = []
  health_check_route_53_records = [
    local.health_check_domain
  ]

  service_discovery_private_dns_namespace = [
    "${var.namespace}.${var.environment}.${local.route_53_zone}"
  ]

  tags = module.arc-tags.tags

}

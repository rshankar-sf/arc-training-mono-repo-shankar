# ARC Tags Module
module "arc-tags" {
  source  = "sourcefuse/arc-tags/aws"
  version = "1.2.3"

  environment = var.environment
  project     = var.project_name

  extra_tags = {
    RepoName = var.repo_name
  }
}



module "cloudfront" {
  source = "git::https://github.com/sourcefuse/terraform-aws-refarch-cloudfront?ref=3.0.0"

  for_each = {
    for index, distribution in local.sf-arc-iac["cloudfront"] :
    distribution.id => distribution
  }


  origins                = each.value.origins
  namespace              = each.value.namespace
  description            = each.value.description
  route53_root_domain    = each.value.route53_root_domain
  create_route53_records = each.value.create_route53_records
  aliases                = each.value.aliases
  enable_logging         = each.value.enable_logging

  default_cache_behavior  = each.value.default_cache_behavior
  viewer_certificate      = each.value.viewer_certificate
  cache_behaviors         = each.value.cache_behaviors
  origin_request_policies = each.value.origin_request_policies
  cache_policies          = each.value.cache_policies

  acm_details            = each.value.acm_details
  custom_error_responses = each.value.custom_error_responses
  s3_kms_details         = each.value.s3_kms_details
  price_class            = each.value.price_class

  tags = module.arc-tags.tags
}

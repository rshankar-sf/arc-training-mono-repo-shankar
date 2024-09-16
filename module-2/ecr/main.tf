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
    MonoRepoPath = "terraform/ecr"
  }
}

################################################################################
## ecr
################################################################################
module "ecr" {
  source  = "cloudposse/ecr/aws"
  version = "0.40.0"

  namespace = var.namespace
  stage     = var.environment
  for_each  = local.ecr_repos
  name      = each.value.name
  tags      = module.arc-tags.tags
}


module "arc-tags" {
  source      = "sourcefuse/arc-tags/aws"
  version     = "1.2.2"
  environment = var.environment
  project     = var.project_name

  extra_tags = {
    Repo = "github.com/sourcefuse/terraform-aws-arc-eks"
  }
}

resource "aws_security_group" "eks-sg" {
  name        = local.security_groups["eks-sg"].name
  description = local.security_groups["eks-sg"].description
  vpc_id      = data.aws_vpc.vpc.id

  tags = module.arc-tags.tags
}

resource "aws_security_group_rule" "eks-sg-rules" {
  count = length(local.security_groups["eks-sg"].rules)

  security_group_id = aws_security_group.eks-sg.id
  type              = local.security_groups["eks-sg"].rules[count.index].type
  from_port         = local.security_groups["eks-sg"].rules[count.index].from_port
  to_port           = local.security_groups["eks-sg"].rules[count.index].to_port
  protocol          = local.security_groups["eks-sg"].rules[count.index].protocol
  cidr_blocks       = [local.security_groups["eks-sg"].rules[count.index].cidr_ipv4]
  description       = local.security_groups["eks-sg"].rules[count.index].key
}


module "eks_cluster" {
  source               = "sourcefuse/arc-eks/aws"
  version              = "5.0.5"
  environment          = var.environment
  name                 = "eks"
  namespace            = var.namespace
  desired_size         = var.desired_size
  instance_types       = var.instance_types
  kubernetes_namespace = var.kubernetes_namespace
  create_node_group    = var.create_node_group
  max_size             = var.max_size
  min_size             = var.min_size

  subnet_ids                = data.aws_subnets.private.ids
  region                    = var.region
  vpc_id                    = data.aws_vpc.vpc.id
  enabled                   = var.enabled
  kubernetes_version        = var.kubernetes_version
  apply_config_map_aws_auth = var.apply_config_map_aws_auth
  kube_data_auth_enabled    = var.kube_data_auth_enabled
  kube_exec_auth_enabled    = var.kube_exec_auth_enabled
  allowed_security_groups   = concat([aws_security_group.eks-sg.id], data.aws_security_groups.db_sg.ids)

}

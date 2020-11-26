module "artifactory" {
  source       = "../../"
  common_tags  = var.common_tags
  subnet_ids   = var.subnet_ids
  vpc_id       = var.vpc_id
  cluster_arn  = "arn:aws:ecs:eu-west-2:680235478471:cluster/test"
  allowed_cidr = var.allowed_cidr
  ssh_cidr     = var.ssh_cidr
}

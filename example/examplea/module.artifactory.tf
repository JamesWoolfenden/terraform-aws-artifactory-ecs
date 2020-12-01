module "artifactory" {
  source             = "../../"
  common_tags        = var.common_tags
  subnet_ids         = var.subnet_ids
  vpc_id             = var.vpc_id
  cluster_arn        = data.aws_ecs_cluster.ecs-artifactory.arn
  ssl_certificate_id = var.ssl_certificate_id
  allowed_cidr       = var.allowed_cidr
  master_key         = var.master_key
  region             = var.region
  instances          = var.instances
  instance_SG        = var.instance_SG
  record             = var.record
  zone_id            = var.zone_id
}

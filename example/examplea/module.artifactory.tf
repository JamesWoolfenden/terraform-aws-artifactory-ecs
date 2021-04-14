module "artifactory" {
  source             = "../../"
  common_tags        = var.common_tags
  allowed_cidr       = [module.ip.cidr]
  cluster_arn        = data.aws_ecs_cluster.ecs-artifactory.arn
  db_password        = random_string.password.result
  instance_SG        = var.instance_SG
  instances          = var.instances
  kms_key_id         = var.kms_key_id
  master_key         = var.master_key
  record             = var.record
  region             = var.region
  ssl_certificate_id = var.ssl_certificate_id
  subnet_ids         = var.subnet_ids
  vpc_id             = var.vpc_id
  zone_id            = var.zone_id
}

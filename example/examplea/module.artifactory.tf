# holden:ignore:HLD_TF_026
module "artifactory" {
  source             = "../../"
  allowed_cidr       = [module.ip.cidr]
  cluster            = aws_ecs_cluster.ecs_artifactory
  instances          = var.instances
  instance_sg        = var.instance_sg
  kms_key_id         = var.kms_key_id
  master_key         = var.master_key
  record             = var.record
  region             = var.region
  ssl_certificate_id = var.ssl_certificate_id
  subnet_ids         = var.subnet_ids
  vpc_id             = var.vpc_id
  zone_id            = var.zone_id
}

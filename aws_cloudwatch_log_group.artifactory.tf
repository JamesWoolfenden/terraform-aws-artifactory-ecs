
resource "aws_cloudwatch_log_group" "artifactory" {
  name              = "/ecs/artifactory"
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id
  tags              = var.common_tags
}

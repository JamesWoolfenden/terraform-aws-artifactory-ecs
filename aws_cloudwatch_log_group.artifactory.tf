
resource "aws_cloudwatch_log_group" "artifactory" {
  name              = "/ecs/artifactory"
  retention_in_days = var.retention_in_days
}

variable "retention_in_days" {
  type    = string
  default = 180
}

resource "aws_ecs_cluster" "ecs_artifactory" {
  name = var.cluster_name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

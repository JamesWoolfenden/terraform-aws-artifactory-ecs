data "aws_ecs_cluster" "ecs-artifactory" {
  cluster_name = var.cluster_name
}
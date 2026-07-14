
output "cluster" {
  value       = aws_ecs_cluster.ecs_artifactory.name
  description = "The name of the cluster"
}

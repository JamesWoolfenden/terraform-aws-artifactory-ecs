/*output "db" {
  value = aws_db_instance.default
}*/

output "cluster" {
  value = data.aws_ecs_cluster.artifactory
}

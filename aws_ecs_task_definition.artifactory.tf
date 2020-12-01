resource "aws_ecs_task_definition" "artifactory" {
  container_definitions = templatefile("${path.module}/task-definitions/artifactory.json", {
    master_key = var.master_key
    region     = var.region
  })

  cpu                = "1024"
  execution_role_arn = aws_iam_role.ecs_artifactory.arn
  family             = "artifactory"
  memory             = "2048"
  requires_compatibilities = [
    "EC2",
  ]

  task_role_arn = aws_iam_role.ecs_artifactory.arn

  lifecycle {
    ignore_changes = [tags]
  }
  tags = var.common_tags
}

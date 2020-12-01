resource "aws_ecs_task_definition" "artifactory" {
  container_definitions = templatefile("${path.module}/task-definitions/artifactory.json", {
    master_key  = var.master_key
    region      = var.region
  })

/*

    db_driver   = "org.postgresql.Driver"
    db_password = var.db_password
    db_type     = "postgresql"
    db_url      = aws_db_instance.default.endpoint
    db_user     = "artifactory"
    db_name     = var.db_name*/

  cpu                = "1024"
  execution_role_arn = aws_iam_role.ecs_artifactory.arn
  family             = "artifactory"
  memory             = "2048"
  requires_compatibilities = [
    "EC2",
  ]

  task_role_arn = aws_iam_role.ecs_artifactory.arn
  /*
  volume {
    host_path = "/data/jfrog/artifactory/etc/"
    name      = "etc"
  }
  volume {
    host_path = "/data/jfrog/artifactory/java_certs"
    name      = "java-certs"
  }
  volume {
    host_path = "/data/jfrog/artifactory/tmp/plugins"
    name      = "temp-plugins"
  }*/

  lifecycle {
    ignore_changes = [tags]
  }
  tags = var.common_tags
}

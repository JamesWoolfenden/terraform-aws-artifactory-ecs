resource "aws_ecs_task_definition" "artifactory" {
  container_definitions = file("${path.module}/task-definitions/artifactory.json")
  cpu                   = "1024"
  execution_role_arn    = aws_iam_role.ecs_artifactory.arn
  family                = "artifactory"

  memory       = "2048"
  network_mode = "awsvpc"
  requires_compatibilities = [
    "EC2",
  ]

  volume {
    name = "artifact-storage"
    docker_volume_configuration {
      scope         = "shared"
      autoprovision = true
      driver        = "local"

      driver_opts = {
        "type"   = "nfs"
        "device" = "${aws_efs_file_system.fs.dns_name}:/"
        "o"      = "addr=${aws_efs_file_system.fs.dns_name},rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport"
      }
    }

  }

  tags = {}
}

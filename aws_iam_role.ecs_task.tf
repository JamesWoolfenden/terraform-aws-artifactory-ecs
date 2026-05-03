resource "aws_iam_role" "ecs_task" {
  assume_role_policy = <<ROLE
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
ROLE

  name = "ArtifactoryEcsTaskRole"
  path = "/"
  tags = var.common_tags
}

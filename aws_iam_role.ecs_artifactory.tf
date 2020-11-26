resource "aws_iam_role" "ecs_artifactory" {
  assume_role_policy = <<ROLE
{
  "Version": "2008-10-17",
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

  name = "ecsTaskExecutionRole"
  path = "/"
  tags = var.common_tags
}

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

  name = "ArtifactoryEcsTaskExecutionRole"
  path = "/"
  tags = var.common_tags
}

resource "aws_iam_role_policy" "ecs_artifactory" {
  name   = "Artifactory-ECS-CloudWatchLogs"
  role   = aws_iam_role.ecs_artifactory.name
  policy = <<LOGS
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogStreams"
            ],
            "Resource": [
                "arn:aws:logs:*:*:*"
            ]
        }
    ]
}
LOGS
}

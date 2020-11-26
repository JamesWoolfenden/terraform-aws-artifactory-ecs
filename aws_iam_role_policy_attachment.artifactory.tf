resource "aws_iam_role_policy_attachment" "artifactory" {
  role       = aws_iam_role.ecs_artifactory.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

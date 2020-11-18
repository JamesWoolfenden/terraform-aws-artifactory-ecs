resource "aws_secretsmanager_secret" "Artifactory" {
  name = "Artifactory"
}

resource "aws_secretsmanager_secret_version" "licence" {
  secret_id     = aws_secretsmanager_secret.Artifactory.id
  secret_string = jsonencode(var.Licence)
}


variable "Licence" {
  type = map(string)
}


output "example" {
  value = jsondecode(aws_secretsmanager_secret_version.licence.secret_string)["ArtifactoryLicense2"]
}

resource "aws_secretsmanager_secret" "artifactory" {
  name                    = "Artifactory"
  kms_key_id              = var.kms_key_id
  recovery_window_in_days = 7
}

resource "aws_secretsmanager_secret_version" "licence" {
  secret_id     = aws_secretsmanager_secret.artifactory.id
  secret_string = jsonencode(var.licence)
}

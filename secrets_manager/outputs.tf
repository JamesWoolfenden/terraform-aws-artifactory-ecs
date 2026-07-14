output "example" {
  value       = jsondecode(aws_secretsmanager_secret_version.licence.secret_string)["ArtifactoryLicense2"]
  description = "The Artifactory license stored in AWS Secrets Manager"
}

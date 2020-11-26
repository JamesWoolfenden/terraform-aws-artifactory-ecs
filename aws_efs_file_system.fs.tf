resource "aws_efs_file_system" "fs" {
  creation_token = "my-artifacts"
  encrypted      = true
}

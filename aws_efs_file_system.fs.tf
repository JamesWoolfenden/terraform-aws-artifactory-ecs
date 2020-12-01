resource "aws_efs_file_system" "fs" {
  creation_token = "my-artifacts"
  encrypted      = true
}

resource "aws_efs_mount_target" "mount" {
  count=length(var.subnet_ids)
  file_system_id = aws_efs_file_system.fs.id
  subnet_id      = var.subnet_ids[count.index]
}
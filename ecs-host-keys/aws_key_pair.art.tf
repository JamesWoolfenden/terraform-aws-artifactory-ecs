resource "aws_key_pair" "art" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_file" "public_ssh" {
  content  = tls_private_key.ssh.public_key_openssh
  filename = "id_rsa.pub"
}

resource "local_file" "private_ssh" {
  content  = tls_private_key.ssh.private_key_pem
  filename = "id_rsa"
}

variable "key_name" {
  type    = string
  default = "artifactory"
}

variable "ssh_cidr" {
  type = list
}

variable "allowed_cidr" {
  type = list
}
variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list
}

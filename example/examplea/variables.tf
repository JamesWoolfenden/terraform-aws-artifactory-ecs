

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


variable "master_key" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "instances" {
  type = list
}

variable "instance_SG" {
  type = string
}

variable "ssl_certificate_id" {
  type = string
}

variable "record" {
  type = string
}

variable "zone_id" {
  type = string
}

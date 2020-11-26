variable "db_name" {
  type        = string
  description = "MySQL database name"
  default     = "artdb"
}

variable "db_user" {
  type        = string
  description = "Database user name"
  default     = "artifactory"
}
variable "db_instance_class" {
  type        = string
  description = "The database instance type"
  default     = "db.t2.small"
}

variable "db_password" {
  type        = string
  description = "Database password"
  default     = "password"
}

variable "db_allocated_storage" {
  type        = string
  description = "The size of the database (Gb)"
  default     = "5"
}
variable "common_tags" {
  type    = map
  default = {}
}


variable "subnet_ids" {
  type = list
}

variable "vpc_id" {
  type = string
}

variable "cluster_arn" {
  type = string
}

variable "ssh_cidr" {
  type = list
}


variable "allowed_cidr" {
  type = list
}

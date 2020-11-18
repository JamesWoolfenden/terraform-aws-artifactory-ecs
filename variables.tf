variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
  default     = "us-west-1"
}

variable "bucket_name" {
  type        = string
  description = "AWS S3 Bucket name"
  default     = "artifactory-enterprise-bucket"
}

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
#TODO Remove
variable "ssl_certificate" {
  description = "To use Artifactory as docker registry you need to provide wild card valid Certificate. Provide your SSL Certificate."
  default     = "<cert contents>"
}

#TODO Remove
variable "ssl_certificate_key" {
  description = "Provide your SSL Certificate key"
  default     = "<cert contents>"
}

variable "certificate_domain" {
  description = "Provide your Certificate Domain Name. For e.g jfrog.team for certificate with *.jfrog.team"
  default     = "artifactory"
}

variable "artifactory_server_name" {
  description = "Provide artifactory server name to be used in Nginx. e.g artifactory for artifactory.jfrog.team"
  default     = "artifactory"
}

variable "common_tags" {
  type = map
  default = {
  "createdby" = "Terraform" }
}

variable "access_cidr" {
  type    = list
  default = ["0.0.0.0/0"]
}

variable "artifactory_sg_name" {
  type        = string
  default     = "artifactory_sg"
  description = "(optional) describe your variable"
}

variable "sse_algorithm" {
  description = "The type of encryption algorithm to use"
  type        = string
  default     = "aws:kms"
}

variable "subnet_ids" {
  type = list
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = list
}

variable "availability_zone" {
}

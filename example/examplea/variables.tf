
variable "vpc_id" {
  type        = string
  description = "ID of the VPC."

  validation {
    condition     = length(var.vpc_id) > 0
    error_message = "The vpc_id must not be empty."
  }
}

variable "subnet_ids" {
  type        = list(any)
  description = "List of subnet IDs."

  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "The subnet_ids list must contain at least one subnet ID."
  }
}

variable "master_key" {
  type        = string
  description = "Master key used for the deployment."
  sensitive   = true

  validation {
    condition     = length(var.master_key) > 0
    error_message = "The master_key must not be empty."
  }
}

variable "region" {
  type        = string
  description = "AWS region where resources will be created."

  validation {
    condition     = length(var.region) > 0
    error_message = "The region must not be empty."
  }
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster."

  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster_name must not be empty."
  }
}

variable "instances" {
  type        = list(any)
  description = "List of instance definitions."

  validation {
    condition     = length(var.instances) > 0
    error_message = "The instances list must contain at least one instance definition."
  }
}

variable "instance_sg" {
  type        = string
  description = "Security group ID for the instances."

  validation {
    condition     = length(var.instance_sg) > 0
    error_message = "The instance_sg must not be empty."
  }
}

variable "ssl_certificate_id" {
  type        = string
  description = "ID of the SSL certificate to use."

  validation {
    condition     = length(var.ssl_certificate_id) > 0
    error_message = "The ssl_certificate_id must not be empty."
  }
}

variable "record" {
  type        = string
  description = "DNS record name for the service."

  validation {
    condition     = length(var.record) > 0
    error_message = "The record must not be empty."
  }
}

variable "zone_id" {
  type        = string
  description = "Route53 hosted zone ID."

  validation {
    condition     = length(var.zone_id) > 0
    error_message = "The zone_id must not be empty."
  }
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ID used for encryption."
  sensitive   = true
  validation {
    condition     = length(var.kms_key_id) > 0
    error_message = "The kms_key_id must not be empty."
  }
}

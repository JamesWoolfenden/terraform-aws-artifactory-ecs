variable "subnet_ids" {
  type        = list(any)
  description = "List of subnet IDs."
  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "The subnet_ids list must contain at least one subnet ID."
  }
}

variable "vpc_id" {
  description = "The VPC id"
  type        = string
  validation {
    condition     = length(var.vpc_id) > 0
    error_message = "The vpc_id must not be empty."
  }
}

variable "cluster" {
  description = "The existing ECS Cluster"
  type = object({
    name = string
    arn  = string
  })
  validation {
    condition     = length(var.cluster) > 0
    error_message = "The cluster must not be empty."
  }
}

variable "allowed_cidr" {
  type        = list(string)
  description = "The allowed IP ranges"

  validation {
    condition     = length(var.allowed_cidr) > 0
    error_message = "allowed_cidr must contain at least one CIDR block."
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

variable "ssl_certificate_id" {
  type        = string
  description = "The ACM certificate ARN for HTTPS listener"

  validation {
    condition     = length(var.ssl_certificate_id) > 0
    error_message = "ssl_certificate_id must not be empty."
  }
}


variable "zone_id" {
  type        = string
  description = "The Route53 zone ID for the domain"
  validation {
    condition     = length(var.zone_id) > 0
    error_message = "The zone_id must not be empty."
  }
}

variable "record" {
  type        = string
  description = "The DNS record for the domain"
  validation {
    condition     = length(var.record) > 0
    error_message = "The record must not be empty."
  }
}

variable "outbound" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "List of outbound CIDR blocks for the security group."
  validation {
    condition     = length(var.outbound) > 0
    error_message = "The outbound list must contain at least one CIDR block."
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


variable "retention_in_days" {
  type        = number
  default     = 365
  description = "The number of days to retain the logs in CloudWatch."
  validation {
    condition     = var.retention_in_days > 0
    error_message = "The retention_in_days must be greater than 0."
  }
}

variable "kms_key_id" {
  type        = string
  sensitive   = true
  description = "The ID of the KMS key for encryption."
  validation {
    condition     = length(var.kms_key_id) > 0
    error_message = "The kms_key_id must not be empty."
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

variable "licence" {
  type        = map(string)
  description = "License configuration map"

  validation {
    condition     = length(var.licence) > 0
    error_message = "Licence map must not be empty."
  }
}

variable "kms_key_id" {
  type        = string
  description = "The KMS key ID to use for encrypting the secret."
  sensitive   = true

  validation {
    condition     = length(trimspace(var.kms_key_id)) > 0
    error_message = "kms_key_id must not be empty."
  }
}

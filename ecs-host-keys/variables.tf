
variable "key_name" {
  type        = string
  default     = "artifactory"
  description = "The name of the SSH key pair"
  sensitive   = true

  validation {
    condition     = length(var.key_name) > 0
    error_message = "The key_name must not be empty."
  }
}

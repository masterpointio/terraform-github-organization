variable "secret_name" {
  type        = string
  description = "Name of the secret."
}

variable "encrypted_value" {
  type        = string
  description = "Encrypted value of the secret using the GitHub public key in Base64 format."
  default     = null
}

variable "plaintext_value" {
  type        = string
  description = "Plaintext value of the secret to be encrypted."
  sensitive   = true
  default     = null
}

variable "visibility" {
  type        = string
  description = "Configures the access that repositories have to the organization secret. Must be one of `all`, `private`, `selected`."
  validation {
    condition     = var.visibility == "all" || var.visibility == "private" || var.visibility == "selected"
    error_message = "Visibility must be either 'all' or 'private'."
  }
}

variable "selected_repository_ids" {
  type        = list(string)
  description = "An array of repository ids that can access the organization secret."
  default     = null
}

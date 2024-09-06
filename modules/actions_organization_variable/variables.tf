variable "variable_name" {
  type        = string
  description = "Name of the variable."
}

variable "value" {
  type        = string
  description = "Value of the variable."
}

variable "visibility" {
  type        = string
  description = "Configures the access that repositories have to the organization variable. Must be one of `all`, `private`, `selected`."
  validation {
    condition     = var.visibility == "all" || var.visibility == "private" || var.visibility == "selected"
    error_message = "Visibility must be one of 'all', 'private', or 'selected'."
  }
}

variable "selected_repository_ids" {
  type        = list(string)
  description = "An array of repository ids that can access the organization secret."
  default     = null
}

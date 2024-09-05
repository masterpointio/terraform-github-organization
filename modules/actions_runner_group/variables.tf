variable "name" {
  description = "Name of the runner group"
  type        = string
}

variable "restricted_to_workflows" {
  description = "If true, the runner group will be restricted to running only the workflows specified in the selected_workflows array. Defaults to false."
  type        = bool
  default     = null
}

variable "selected_repository_ids" {
  description = "IDs of the repositories which should be added to the runner group"
  type        = list(string)
  default     = null
}

variable "selected_workflows" {
  description = "List of workflows the runner group should be allowed to run. This setting will be ignored unless restricted_to_workflows is set to true."
  type        = list(string)
  default     = null
}

variable "visibility" {
  description = "Visibility of a runner group. Whether the runner group can include `all`, `selected`, or `private` repositories. A value of private is not currently supported due to limitations in the GitHub API."
  type        = string
  default     = null
  validation {
    condition     = can(regex("^(all|selected|private)$", var.visibility)) || var.visibility == null
    error_message = "visibility must be one of 'all' 'selected' or 'private'"
  }
}

variable "allows_public_repositories" {
  description = "Whether public repositories can be added to the runner group"
  type        = bool
  default     = null
}

variable "allowed_actions" {
  type        = string
  description = "The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`."
  validation {
    condition     = var.allowed_actions == "all" || var.allowed_actions == "local_only" || var.allowed_actions == "selected"
    error_message = "Allowed actions must be either 'all', 'local_only', or 'selected'."
  }
  default = null
}

variable "allowed_actions_config" {
  type = object({
    github_owned_allowed = bool
    patterns_allowed     = optional(list(string))
    verified_allowed     = optional(bool)
  })
  description = <<-EOT
    Sets the actions that are allowed in an organization.
    Only available when allowed_actions = selected.
    See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_permissions#allowed-actions-config for details.
    {
      github_owned_allowed: (Required, bool) Whether GitHub-owned actions are allowed in the organization.
      patterns_allowed: (Optional, list(string)) Specifies a list of string-matching patterns to allow specific action(s). Wildcards, tags, and SHAs are allowed. For example, monalisa/octocat@, monalisa/octocat@v2, monalisa/."
      verified_allowed: (Optional, bool) Whether actions in GitHub Marketplace from verified creators are allowed. Set to true to allow all GitHub Marketplace actions by verified creators.
    }
  EOT
  default     = null
}

variable "enabled_repositories" {
  type        = list(string)
  description = "The permissions policy that controls which repositories can run actions. Can be one of: `all`, `local_only`, or `selected`."
  validation {
    condition     = var.enabled_repositories == "all" || var.enabled_repositories == "local_only" || var.enabled_repositories == "selected"
    error_message = "Enabled repositories must be either 'all', 'local_only', or 'selected'."
  }
}

variable "enabled_repositories_config" {
  type = list(object({
    repository_ids = list(string)
  }))
  description = <<-EOT
    Sets the list of selected repositories that are enabled for GitHub Actions in an organization.
    Only available when enabled_repositories = selected.
    See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_permissions#enabled-repositories-config for details.
    {
      repository_ids: (Required, list(string)) A list of repository IDs that are allowed to run actions.
    }
  EOT
  default     = null
}

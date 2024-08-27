variable "enforcement" {
  description = "Possible values for Enforcement are `disabled`, `active`, `evaluate`. Note: `evaluate` is currently only supported for owners of type organization."
  type        = string
  validation {
    condition     = var.enforcement == "disabled" || var.enforcement == "active" || var.enforcement == "evaluate"
    error_message = "Enforcement must be either 'disabled', 'active', or 'evaluate'."
  }
}

variable "name" {
  description = "The name of the ruleset."
  type        = string
}

variable "rules" {
  description = "Rules within the ruleset. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_ruleset#rules"
  type = list(object({
    # Enterprise only! Use `conditions` block for matching branches.
    branch_name_pattern = optional(list(object({
      operator = string
      pattern  = string
      name     = optional(string)
      negate   = optional(bool)
    })), [])
    # Enterprise only!
    commit_author_email_pattern = optional(list(object({
      operator = string
      pattern  = string
      name     = optional(string)
      negate   = optional(bool)
    })), [])
    # Enterprise only!
    commit_message_pattern = optional(list(object({
      operator = string
      pattern  = string
      name     = optional(string)
      negate   = optional(bool)
    })), [])
    # Enterprise only!
    committer_email_pattern = optional(list(object({
      operator = string
      pattern  = string
      name     = optional(string)
      negate   = optional(bool)
    })), [])
    creation         = optional(bool)
    deletion         = optional(bool)
    non_fast_forward = optional(bool)
    pull_request = optional(list(object({
      dismiss_stale_reviews_on_push     = optional(bool)
      require_code_owner_review         = optional(bool)
      require_last_push_approval        = optional(bool)
      required_approving_review_count   = optional(number)
      required_review_thread_resolution = optional(bool)
    })), [])
    required_linear_history = optional(bool)
    required_signatures     = optional(bool)
    required_status_checks = optional(list(object({
      required_check = list(object({
        context        = string
        integration_id = optional(number)
      }))
      strict_required_status_checks_policy = optional(bool)
    })), [])
    required_workflows = optional(list(object({
      required_workflow = list(object({
        repository_id = number
        path          = string
        ref           = optional(string)
      }))
    })), [])
    tag_name_pattern = optional(list(object({
      operator = string
      pattern  = string
      name     = optional(string)
      negate   = optional(bool)
    })), [])
    update = optional(bool)
  }))
  validation {
    condition     = length(var.rules) == 1
    error_message = "Only one rules block is allowed."
  }
  validation {
    condition     = length(var.rules[*].branch_name_pattern) <= 1 && length(var.rules[*].commit_author_email_pattern) <= 1 && length(var.rules[*].commit_message_pattern) <= 1 && length(var.rules[*].committer_email_pattern) <= 1 && length(var.rules[*].pull_request) <= 1 && length(var.rules[*].required_status_checks) <= 1 && length(var.rules[*].required_workflows) <= 1 && length(var.rules[*].tag_name_pattern) <= 1
    error_message = "commit_author_email_pattern, commit_message_pattern, committer_email_pattern, pull_request, required_status_checks, required_workflows, and tag_name_pattern can have a maximum of one block."
  }
}

variable "target" {
  description = "Possible values are `branch` and `tag`."
  type        = string
  validation {
    condition     = var.target == "branch" || var.target == "tag"
    error_message = "Target must be either 'branch' or 'tag'."
  }
}

variable "bypass_actors" {
  description = "The actors that can bypass the rules in this ruleset. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_ruleset#bypass_actors"
  type = list(object({
    actor_id    = number
    actor_type  = string
    bypass_mode = optional(string)
  }))
  default = []
}

variable "conditions" {
  description = "Parameters for an organization ruleset condition. `ref_name` is required alongside one of `repository_name` or `repository_id`. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_ruleset#conditions"
  type = list(object({
    ref_name = list(object({
      exclude = list(string)
      include = list(string)
    }))
    repository_id = optional(list(number), [])
    repository_name = optional(list(object({
      exclude = list(string)
      include = list(string)
    })), [])
  }))
  default = []
}

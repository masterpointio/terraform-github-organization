module "organization_settings" {
  source = "./modules/organization_settings"

  billing_email                                                = var.billing_email
  company                                                      = var.company
  blog                                                         = var.blog
  email                                                        = var.email
  twitter_username                                             = var.twitter_username
  location                                                     = var.location
  name                                                         = var.organization_name
  description                                                  = var.description
  has_organization_projects                                    = var.has_organization_projects
  has_repository_projects                                      = var.has_repository_projects
  default_repository_permission                                = var.default_repository_permission
  members_can_create_repositories                              = var.members_can_create_repositories
  members_can_create_public_repositories                       = var.members_can_create_public_repositories
  members_can_create_private_repositories                      = var.members_can_create_private_repositories
  members_can_create_internal_repositories                     = var.members_can_create_internal_repositories
  members_can_create_pages                                     = var.members_can_create_pages
  members_can_create_public_pages                              = var.members_can_create_public_pages
  members_can_create_private_pages                             = var.members_can_create_private_pages
  members_can_fork_private_repositories                        = var.members_can_fork_private_repositories
  web_commit_signoff_required                                  = var.web_commit_signoff_required
  advanced_security_enabled_for_new_repositories               = var.advanced_security_enabled_for_new_repositories
  dependabot_alerts_enabled_for_new_repositories               = var.dependabot_alerts_enabled_for_new_repositories
  dependabot_security_updates_enabled_for_new_repositories     = var.dependabot_security_updates_enabled_for_new_repositories
  dependency_graph_enabled_for_new_repositories                = var.dependency_graph_enabled_for_new_repositories
  secret_scanning_enabled_for_new_repositories                 = var.secret_scanning_enabled_for_new_repositories
  secret_scanning_push_protection_enabled_for_new_repositories = var.secret_scanning_push_protection_enabled_for_new_repositories
}

module "actions_runner_group" {
  source   = "./modules/actions_runner_group"
  for_each = var.actions_runner_groups

  name                       = var.runner_group_name
  restricted_to_workflows    = var.restricted_to_workflows
  selected_repository_ids    = var.selected_repository_ids
  selected_workflows         = var.selected_workflows
  visibility                 = var.visibility
  allows_public_repositories = var.allows_public_repositories
}

module "organization_block" {
  source   = "./modules/organization_block"
  for_each = toset(var.blocked_usernames)

  username = each.value
}

module "organization_ruleset" {
  for_each = var.organization_rulesets
}

variable "organization_rulesets" {
  description = "A map of organization rulesets to create. The map key is the name of the ruleset."
  type = map(object({
    enforcement = string
    rules = list(object({
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
    target = string
    bypass_actors = optional(list(object({
      actor_id    = number
      actor_type  = string
      bypass_mode = optional(string)
    })), [])
  }))
}

module "organization_secret" {
  source   = "./modules/actions_organization_secrets"
  for_each = var.organization_secrets

  secret_name             = each.key
  encrypted_value         = each.value.encrypted_value
  plaintext_value         = each.value.plaintext_value
  visibility              = each.value.visibility
  selected_repository_ids = each.value.selected_repository_ids
}

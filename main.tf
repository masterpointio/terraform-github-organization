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
  source = "./modules/organization_ruleset"

  for_each = var.organization_rulesets

  name          = each.key
  enforcement   = each.value.enforcement
  rules         = each.value.rules
  target        = each.value.target
  bypass_actors = each.value.bypass_actors
}
module "organization_secret" {
  source   = "./modules/actions_organization_secret"
  for_each = var.organization_secrets

  secret_name             = each.key
  encrypted_value         = each.value.encrypted_value
  plaintext_value         = each.value.plaintext_value
  visibility              = each.value.visibility
  selected_repository_ids = each.value.selected_repository_ids
}

module "organization_variable" {
  source   = "./modules/actions_organization_variable"
  for_each = var.organization_variables

  variable_name           = each.key
  value                   = each.value.value
  visibility              = each.value.visibility
  selected_repository_ids = each.value.selected_repository_ids
}

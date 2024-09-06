resource "github_actions_organization_permissions" "this" {
  allowed_actions = var.allowed_actions

  dynamic "allowed_actions_config" {
    for_each = var.allowed_actions_config == null ? [] : [var.allowed_actions_config]
    content {
      github_owned_allowed = allowed_actions_config.value.github_owned_allowed
      patterns_allowed     = allowed_actions_config.value.patterns_allowed
      verified_allowed     = allowed_actions_config.value.verified_allowed
    }
  }

  enabled_repositories = var.enabled_repositories

  dynamic "enabled_repositories_config" {
    for_each = var.enabled_repositories_config
    content {
      repository_ids = enabled_repositories_config.value.repository_ids
    }
  }
}

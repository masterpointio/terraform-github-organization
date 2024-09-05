output "github_actions_allowed" {
  value = github_actions_organization_permissions.this.allowed_actions_config.github_owned_allowed
}

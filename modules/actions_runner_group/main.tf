resource "github_actions_runner_group" "this" {
  name                       = var.name
  restricted_to_workflows    = var.restricted_to_workflows
  selected_repository_ids    = var.selected_repository_ids
  selected_workflows         = var.selected_workflows
  visibility                 = var.visibility
  allows_public_repositories = var.allows_public_repositories
}

output "allows_public_repositories" {
  description = "Whether public repositories can be added to the runner group"
  value       = github_actions_runner_group.this.allows_public_repositories
}

output "default" {
  description = "Whether this is the default runner group"
  value       = github_actions_runner_group.this.default
}

output "etag" {
  description = "An etag representing the runner group object"
  value       = github_actions_runner_group.this.etag
}

output "inherited" {
  description = "Whether the runner group is inherited from the enterprise level"
  value       = github_actions_runner_group.this.inherited
}

output "runners_url" {
  description = "The GitHub API URL for the runner group's runners"
  value       = github_actions_runner_group.this.runners_url
}

output "selected_repository_ids" {
  description = "List of repository IDs that can access the runner group"
  value       = github_actions_runner_group.this.selected_repository_ids
}

output "selected_repositories_url" {
  description = "GitHub API URL for the runner group's repositories"
  value       = github_actions_runner_group.this.selected_repositories_url
}

output "visibility" {
  description = "The visibility of the runner group"
  value       = github_actions_runner_group.this.visibility
}

output "restricted_to_workflows" {
  description = "If true, the runner group will be restricted to running only the workflows specified in the selected_workflows array. Defaults to false."
  value       = github_actions_runner_group.this.restricted_to_workflows
}

output "selected_workflows" {
  description = "List of workflows the runner group should be allowed to run. This setting will be ignored unless restricted_to_workflows is set to true."
  value       = github_actions_runner_group.this.selected_workflows
}

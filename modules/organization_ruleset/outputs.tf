output "etag" {
  value = github_organization_ruleset.this[*].etag
}

output "node_id" {
  value       = github_organization_ruleset.this[*].node_id
  description = "GraphQL global node id for use with v4 API."
}

output "ruleset_id" {
  value       = github_organization_ruleset.this[*].ruleset_id
  description = "GitHub ID for the ruleset."
}

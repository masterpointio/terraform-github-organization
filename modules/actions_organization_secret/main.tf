resource "github_actions_organization_secret" "this" {
  secret_name             = var.secret_name
  encrypted_value         = var.encrypted_value
  plaintext_value         = var.plaintext_value
  visibility              = var.visibility
  selected_repository_ids = var.selected_repository_ids
}

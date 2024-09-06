resource "github_actions_organization_variable" "this" {
  variable_name           = var.variable_name
  visibility              = var.visibility
  value                   = var.value
  selected_repository_ids = var.selected_repository_ids
}

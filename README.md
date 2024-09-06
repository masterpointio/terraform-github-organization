# terraform-github-organization

[![Release](https://img.shields.io/github/release/masterpointio/terraform-module-template.svg)](https://github.com/masterpointio/terraform-module-template/releases/latest)

This module and its submodules contain configuration for managing an organization and configuration items which are at the organization scope in github.

## Usage

TODO

<!-- BEGIN_TF_DOCS -->
<!-- prettier-ignore-start -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| actions_runner_group | ./modules/actions_runner_group | n/a |
| organization_block | ./modules/organization_block | n/a |
| organization_ruleset | ./modules/organization_ruleset | n/a |
| organization_secret | ./modules/actions_organization_secret | n/a |
| organization_settings | ./modules/organization_settings | n/a |
| organization_variable | ./modules/actions_organization_variable | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| actions_runner_groups | A map of actions runner groups to create in your GitHub organization. Map key is the name of the runner group. | ```map(object({ restricted_to_workflows = optional(list(string)) selected_repository_ids = optional(list(string)) selected_workflows = optional(list(string)) visibility = optional(string) allows_public_repositories = optional(bool) }))``` | `{}` | no |
| advanced_security_enabled_for_new_repositories | Whether or not advanced security is enabled for new repositories. Defaults to false. | `bool` | `null` | no |
| allows_public_repositories | Whether public repositories can be added to the runner group | `bool` | `null` | no |
| billing_email | The billing email address for the organization. | `string` | n/a | yes |
| blocked_usernames | A list of usernames to block from your GitHub organization. | `list(string)` | `[]` | no |
| blog | The blog URL for the organization. | `string` | `null` | no |
| company | The company name for the organization. | `string` | `null` | no |
| default_repository_permission | The default permission for organization members to create new repositories. Can be one of read, write, admin, or none. Defaults to read. | `string` | `null` | no |
| dependabot_alerts_enabled_for_new_repositories | Whether or not dependabot alerts are enabled for new repositories. Defaults to false. | `bool` | `null` | no |
| dependabot_security_updates_enabled_for_new_repositories | Whether or not dependabot security updates are enabled for new repositories. Defaults to false. | `bool` | `null` | no |
| dependency_graph_enabled_for_new_repositories | Whether or not dependency graph is enabled for new repositories. Defaults to false. | `bool` | `null` | no |
| description | The description for the organization. | `string` | `null` | no |
| email | The email address for the organization. | `string` | `null` | no |
| has_organization_projects | Whether or not organization projects are enabled for the organization. | `bool` | `null` | no |
| has_repository_projects | Whether or not repository projects are enabled for the organization. | `bool` | `null` | no |
| location | The location for the organization. | `string` | `null` | no |
| members_can_create_internal_repositories | Whether or not organization members can create new internal repositories. For Enterprise Organizations only. | `bool` | `null` | no |
| members_can_create_pages | Whether or not organization members can create new pages. Defaults to true. | `bool` | `null` | no |
| members_can_create_private_pages | Whether or not organization members can create new private pages. Defaults to true. | `bool` | `null` | no |
| members_can_create_private_repositories | Whether or not organization members can create new private repositories. Defaults to true. | `bool` | `null` | no |
| members_can_create_public_pages | Whether or not organization members can create new public pages. Defaults to true. | `bool` | `null` | no |
| members_can_create_public_repositories | Whether or not organization members can create new public repositories. Defaults to true. | `bool` | `null` | no |
| members_can_create_repositories | Whether or not organization members can create new repositories. Defaults to true. | `bool` | `null` | no |
| members_can_fork_private_repositories | Whether or not organization members can fork private repositories. Defaults to false. | `bool` | `null` | no |
| organization_name | The name for the organization. | `string` | `null` | no |
| organization_rulesets | A map of organization rulesets to create. The map key is the name of the ruleset. | ```map(object({ enforcement = string rules = list(object({ # Enterprise only! Use `conditions` block for matching branches. branch_name_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) # Enterprise only! commit_author_email_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) # Enterprise only! commit_message_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) # Enterprise only! committer_email_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) creation = optional(bool) deletion = optional(bool) non_fast_forward = optional(bool) pull_request = optional(list(object({ dismiss_stale_reviews_on_push = optional(bool) require_code_owner_review = optional(bool) require_last_push_approval = optional(bool) required_approving_review_count = optional(number) required_review_thread_resolution = optional(bool) })), []) required_linear_history = optional(bool) required_signatures = optional(bool) required_status_checks = optional(list(object({ required_check = list(object({ context = string integration_id = optional(number) })) strict_required_status_checks_policy = optional(bool) })), []) required_workflows = optional(list(object({ required_workflow = list(object({ repository_id = number path = string ref = optional(string) })) })), []) tag_name_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) update = optional(bool) })) target = string bypass_actors = optional(list(object({ actor_id = number actor_type = string bypass_mode = optional(string) })), []) }))``` | n/a | yes |
| organization_secrets | A map of organization secrets to create. The map key is the secret name. | ```map(object({ encrypted_value = optional(string) plaintext_value = optional(string) visibility = string selected_repository_ids = optional(list(string)) }))``` | `{}` | no |
| organization_variables | n/a | ```map(object({ value = string visibility = string selected_repository_ids = optional(list(string)) }))``` | n/a | yes |
| restricted_to_workflows | If true, the runner group will be restricted to running only the workflows specified in the selected_workflows array. Defaults to false. | `bool` | `null` | no |
| runner_group_name | Name of the runner group | `string` | n/a | yes |
| secret_scanning_enabled_for_new_repositories | Whether or not secret scanning is enabled for new repositories. Defaults to false. | `bool` | `null` | no |
| secret_scanning_push_protection_enabled_for_new_repositories | Whether or not secret scanning push protection is enabled for new repositories. Defaults to false. | `bool` | `null` | no |
| selected_repository_ids | IDs of the repositories which should be added to the runner group | `list(string)` | `[]` | no |
| selected_workflows | List of workflows the runner group should be allowed to run. This setting will be ignored unless restricted_to_workflows is set to true. | `list(string)` | `[]` | no |
| twitter_username | The Twitter username for the organization. | `string` | `null` | no |
| visibility | Visibility of a runner group. Whether the runner group can include `all`, `selected`, or `private` repositories. A value of private is not currently supported due to limitations in the GitHub API. | `string` | n/a | yes |
| web_commit_signoff_required | Whether or not commit signatures are required for commits to the organization. Defaults to false. | `bool` | `null` | no |

## Outputs

No outputs.


## Contributing

Contributions are welcome and appreciated!

Found an issue or want to request a feature? [Open an issue](TODO)

Want to fix a bug you found or add some functionality? Fork, clone, commit, push, and PR and we'll check it out.

If you have any issues or are waiting a long time for a PR to get merged then feel free to ping us at [hello@masterpoint.io](mailto:hello@masterpoint.io).

## Built By

[![Masterpoint Logo](https://i.imgur.com/RDLnuQO.png)](https://masterpoint.io)

<!-- prettier-ignore-end -->
<!-- END_TF_DOCS -->

<!-- BEGIN_TF_DOCS -->
<!-- prettier-ignore-start -->

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| github | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_organization_ruleset.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/organization_ruleset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bypass_actors | The actors that can bypass the rules in this ruleset. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_ruleset#bypass_actors | ```list(object({ actor_id = number actor_type = string bypass_mode = optional(string) }))``` | `[]` | no |
| conditions | Parameters for an organization ruleset condition. `ref_name` is required alongside one of `repository_name` or `repository_id`. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_ruleset#conditions | ```list(object({ ref_name = list(object({ exclude = list(string) include = list(string) })) repository_id = optional(list(number), []) repository_name = optional(list(object({ exclude = list(string) include = list(string) })), []) }))``` | `[]` | no |
| enforcement | Possible values for Enforcement are `disabled`, `active`, `evaluate`. Note: `evaluate` is currently only supported for owners of type organization. | `string` | n/a | yes |
| name | The name of the ruleset. | `string` | n/a | yes |
| rules | Rules within the ruleset. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_ruleset#rules | ```list(object({ # Enterprise only! Use `conditions` block for matching branches. branch_name_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) # Enterprise only! commit_author_email_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) # Enterprise only! commit_message_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) # Enterprise only! committer_email_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) creation = optional(bool) deletion = optional(bool) non_fast_forward = optional(bool) pull_request = optional(list(object({ dismiss_stale_reviews_on_push = optional(bool) require_code_owner_review = optional(bool) require_last_push_approval = optional(bool) required_approving_review_count = optional(number) required_review_thread_resolution = optional(bool) })), []) required_linear_history = optional(bool) required_signatures = optional(bool) required_status_checks = optional(list(object({ required_check = list(object({ context = string integration_id = optional(number) })) strict_required_status_checks_policy = optional(bool) })), []) required_workflows = optional(list(object({ required_workflow = list(object({ repository_id = number path = string ref = optional(string) })) })), []) tag_name_pattern = optional(list(object({ operator = string pattern = string name = optional(string) negate = optional(bool) })), []) update = optional(bool) }))``` | n/a | yes |
| target | Possible values are `branch` and `tag`. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| etag | n/a |
| node_id | GraphQL global node id for use with v4 API. |
| ruleset_id | GitHub ID for the ruleset. |


## Contributing

Contributions are welcome and appreciated!

Found an issue or want to request a feature? [Open an issue](TODO)

Want to fix a bug you found or add some functionality? Fork, clone, commit, push, and PR and we'll check it out.

If you have any issues or are waiting a long time for a PR to get merged then feel free to ping us at [hello@masterpoint.io](mailto:hello@masterpoint.io).

## Built By

[![Masterpoint Logo](https://i.imgur.com/RDLnuQO.png)](https://masterpoint.io)

<!-- prettier-ignore-end -->
<!-- END_TF_DOCS -->

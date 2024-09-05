#

<!-- BEGIN_TF_DOCS -->
<!-- prettier-ignore-start -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >=1.3 |
| github | >= 6.2.3 |

## Providers

| Name | Version |
|------|---------|
| github | >= 6.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_organization_permissions.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_permissions) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed_actions | The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`. | `string` | `null` | no |
| allowed_actions_config | Sets the actions that are allowed in an organization. Only available when allowed_actions = selected. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_permissions#allowed-actions-config for details. {   github_owned_allowed: (Required, bool) Whether GitHub-owned actions are allowed in the organization.   patterns_allowed: (Optional, list(string)) Specifies a list of string-matching patterns to allow specific action(s). Wildcards, tags, and SHAs are allowed. For example, monalisa/octocat@, monalisa/octocat@v2, monalisa/."   verified_allowed: (Optional, bool) Whether actions in GitHub Marketplace from verified creators are allowed. Set to true to allow all GitHub Marketplace actions by verified creators. } | ```object({ github_owned_allowed = bool patterns_allowed = optional(list(string)) verified_allowed = optional(bool) })``` | `null` | no |
| enabled_repositories | The permissions policy that controls which repositories can run actions. Can be one of: `all`, `local_only`, or `selected`. | `list(string)` | n/a | yes |
| enabled_repositories_config | Sets the list of selected repositories that are enabled for GitHub Actions in an organization. Only available when enabled_repositories = selected. See https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_permissions#enabled-repositories-config for details. {   repository_ids: (Required, list(string)) A list of repository IDs that are allowed to run actions. } | ```list(object({ repository_ids = list(string) }))``` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| github_actions_allowed | n/a |


## Contributing

Contributions are welcome and appreciated!

Found an issue or want to request a feature? [Open an issue](TODO)

Want to fix a bug you found or add some functionality? Fork, clone, commit, push, and PR and we'll check it out.

If you have any issues or are waiting a long time for a PR to get merged then feel free to ping us at [hello@masterpoint.io](mailto:hello@masterpoint.io).

## Built By

[![Masterpoint Logo](https://i.imgur.com/RDLnuQO.png)](https://masterpoint.io)

<!-- prettier-ignore-end -->
<!-- END_TF_DOCS -->

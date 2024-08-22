# github_actions_runner_group

This module manages a GitHub Actions runner group, which is a collection of runners that can be used to run workflows in GitHub Actions.

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
| [github_actions_runner_group.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_runner_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allows_public_repositories | Whether public repositories can be added to the runner group | `bool` | `null` | no |
| name | Name of the runner group | `string` | n/a | yes |
| restricted_to_workflows | If true, the runner group will be restricted to running only the workflows specified in the selected_workflows array. Defaults to false. | `bool` | `null` | no |
| selected_repository_ids | IDs of the repositories which should be added to the runner group | `list(string)` | `[]` | no |
| selected_workflows | List of workflows the runner group should be allowed to run. This setting will be ignored unless restricted_to_workflows is set to true. | `list(string)` | `[]` | no |
| visibility | Visibility of a runner group. Whether the runner group can include all, selected, or private repositories. A value of private is not currently supported due to limitations in the GitHub API. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| allows_public_repositories | Whether public repositories can be added to the runner group |
| default | Whether this is the default runner group |
| etag | An etag representing the runner group object |
| inherited | Whether the runner group is inherited from the enterprise level |
| restricted_to_workflows | If true, the runner group will be restricted to running only the workflows specified in the selected_workflows array. Defaults to false. |
| runners_url | The GitHub API URL for the runner group's runners |
| selected_repositories_url | GitHub API URL for the runner group's repositories |
| selected_repository_ids | List of repository IDs that can access the runner group |
| selected_workflows | List of workflows the runner group should be allowed to run. This setting will be ignored unless restricted_to_workflows is set to true. |
| visibility | The visibility of the runner group |


## Contributing

Contributions are welcome and appreciated!

Found an issue or want to request a feature? [Open an issue](TODO)

Want to fix a bug you found or add some functionality? Fork, clone, commit, push, and PR and we'll check it out.

If you have any issues or are waiting a long time for a PR to get merged then feel free to ping us at [hello@masterpoint.io](mailto:hello@masterpoint.io).

## Built By

[![Masterpoint Logo](https://i.imgur.com/RDLnuQO.png)](https://masterpoint.io)

<!-- prettier-ignore-end -->
<!-- END_TF_DOCS -->

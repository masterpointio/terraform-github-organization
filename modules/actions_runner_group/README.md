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
| test | test |


<!-- prettier-ignore-end -->
<!-- END_TF_DOCS -->

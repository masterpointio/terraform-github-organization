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
| terraform | >= 1.0 |
| random | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| random | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_pet.template](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| length | The length of the random name | `number` | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| random_pet_name | The generated random pet name |


## Contributing

Contributions are welcome and appreciated!

Found an issue or want to request a feature? [Open an issue](TODO)

Want to fix a bug you found or add some functionality? Fork, clone, commit, push, and PR and we'll check it out.

If you have any issues or are waiting a long time for a PR to get merged then feel free to ping us at [hello@masterpoint.io](mailto:hello@masterpoint.io).

## Built By

[![Masterpoint Logo](https://i.imgur.com/RDLnuQO.png)](https://masterpoint.io)

<!-- prettier-ignore-end -->
<!-- END_TF_DOCS -->

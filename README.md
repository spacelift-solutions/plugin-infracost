# Plugin Infracost

This module adds the `infracost` plugin to your Spacelift account.

## Usage

1. Spin up the module (see examples below)
2. Add the `infracost` label to any stack.
3. Any policies defined will automatically be evaluated against infracost.

<!-- BEGIN_TF_DOCS -->

## Example

```hcl
module "plugin_sops" {
  source = "spacelift.io/spacelift-solutions/plugin-sops/spacelift"

  # Optional Variables
  name     = "plugin-sops"
  space_id = "root"
}
```

## Inputs

| Name                                                         | Description         | Type     | Default         | Required |
|--------------------------------------------------------------|---------------------|----------|-----------------|:--------:|
| <a name="input_name"></a> [name](#input\_name)               | Name of the context | `string` | `"plugin_sops"` |    no    |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | ID of the space     | `string` | `"root"`        |    no    |

<!-- END_TF_DOCS -->

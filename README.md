# Plugin Infracost

> **⚠️ DEPRECATED**: This repository is no longer maintained. The Infracost plugin functionality is now built directly into Spacelift's native plugins feature. Customers can install and configure the Infracost plugin through the Spacelift UI or API instead of using this Terraform module.
>
> For current documentation on using the Infracost plugin, please refer to the [Spacelift documentation](https://docs.spacelift.io).

---

## Legacy Documentation

This module adds the `infracost` plugin to your Spacelift account.

## Usage

1. Spin up the module (see examples below)
2. Add the `infracost` label to any stack.
3. Any policies defined will automatically be evaluated against infracost.

<!-- BEGIN_TF_DOCS -->
## Example

```hcl
module "plugin_infracost" {
  source = "spacelift.io/spacelift-solutions/plugin-infracost/spacelift"

  # Required Variables
  infracost_api_key = "{your_infracost_api_key}"

  policies = {
    DEFAULT = file("${path.module}/cost_restriction.rego")
  }

  # Optional Variables
  space_id = "root"
}
```

You can use the following rego as a starting point for your cost restriction policy:
```rego
package spacelift

# This example plan policy demonstrates using data from infracost to
# ensure that resources can't be created if their mostly cost is greater than
# a specific threshold while displaying a warning if their cost is above
# a different threshold.
#
# You can read more about plan policies here:
# https://docs.spacelift.io/concepts/policy/terraform-plan-policy

# Prevent any changes that will cause the monthly cost to go above a certain threshold
deny[sprintf("monthly cost greater than $%d ($%.2f)", [threshold, monthly_cost])] {
	threshold := 100
	monthly_cost := to_number(input.third_party_metadata.infracost.projects[0].breakdown.totalMonthlyCost)
	monthly_cost > threshold
}

# Warn if the monthly costs increase more than a certain percentage
warn[sprintf("monthly cost increase greater than %d%% (%.2f%%)", [threshold, percentage_increase])] {
	threshold := 5
	previous_cost := to_number(input.third_party_metadata.infracost.projects[0].pastBreakdown.totalMonthlyCost)
	previous_cost > 0

	monthly_cost := to_number(input.third_party_metadata.infracost.projects[0].breakdown.totalMonthlyCost)
	percentage_increase := ((monthly_cost - previous_cost) / previous_cost) * 100

	percentage_increase > threshold
}

# Learn more about sampling policy evaluations here:
# https://docs.spacelift.io/concepts/policy#sampling-policy-inputs
sample := true
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_infracost_api_key"></a> [infracost\_api\_key](#input\_infracost\_api\_key) | API key required for the infracost integration | `string` | n/a | yes |
| <a name="input_policies"></a> [policies](#input\_policies) | Map of policies to create/automatically attach to any stack that runs infracost | `map(string)` | `{}` | no |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | The space to create resources in | `string` | `"root"` | no |
<!-- END_TF_DOCS -->

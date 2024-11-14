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
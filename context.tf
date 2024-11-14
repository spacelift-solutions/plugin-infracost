resource "spacelift_context" "plugin_infracost" {
  name       = "plugin_infracost"
  after_plan = ["infracost breakdown --path . --out-file infracost.custom.spacelift.json --format json"]
  labels     = ["autoattach:infracost"]
  space_id   = var.space_id
}

resource "spacelift_environment_variable" "infracost_api_key" {
  context_id = spacelift_context.plugin_infracost.id
  name       = "INFRACOST_API_KEY"
  value      = var.infracost_api_key
}

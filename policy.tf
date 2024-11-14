resource "spacelift_policy" "cost_restriction" {
  name   = "infracost cost restriction"
  type   = "PLAN"
  body   = file("./cost_restriction.rego")
  labels = ["autoattach:infracost"]
}

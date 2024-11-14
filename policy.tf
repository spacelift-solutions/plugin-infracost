resource "spacelift_policy" "cost_restriction" {
  for_each = var.policies

  name   = each.key
  type   = "PLAN"
  body   = each.value
  labels = ["autoattach:infracost"]
}

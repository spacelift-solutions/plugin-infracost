variable "infracost_api_key" {
  type        = string
  description = "API key required for the infracost integration"
  sensitive   = true
}

variable "policies" {
  type        = map(string)
  description = "Map of policies to create/automatically attach to any stack that runs infracost"
  default     = {}
}

variable "space_id" {
  type        = string
  description = "The space to create resources in"
  default     = "root"
}

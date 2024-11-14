variable "infracost_api_key" {
  type        = string
  description = "API key required for the infracost integration"
  sensitive   = true
}


variable "space_id" {
  type        = string
  description = "The space to create resources in"
  default     = "root"
}

terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.17.0"
    }
  }
}

provider "spacelift" {}

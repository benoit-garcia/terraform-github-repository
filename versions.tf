terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6, >= 6.12.0"
    }
  }

  required_version = "~> 1"
}

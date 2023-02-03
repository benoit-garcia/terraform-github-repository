terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.16"
    }
  }

  required_version = "~> 1.0"
}

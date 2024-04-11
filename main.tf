terraform {
  required_version = ">= 0.13"
  required_providers {
    tfe = {
      version = "~> 0.53.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.2.1"
    }
  }
}

provider "tfe" {
  hostname = var.terraform_address
  token    = var.terraform_token
}

provider "github" {
  token = var.github_token
}


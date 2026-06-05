terraform {
  required_version = ">= 1.3"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.60.0"
    }
  }
  cloud {
    organization = "fleejy-hashi"
    hostname     = "app.terraform.io"

    workspaces {
      project = "PLATFORM"
      name    = "platform-admin-management"
    }
  }
}

provider "tfe" {
  hostname     = var.tfe_hostname
  organization = var.tfe_organization
}

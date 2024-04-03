terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region = var.region #have used variable to not hardcode anything
}


provider "vault" {
  address          = var.vault_address # Replace with your Vault server address
  skip_child_token = true


  # Reference role_id and secret_id from terraform.tfvars
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}


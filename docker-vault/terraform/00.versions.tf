# 00.versions.tf

terraform {
  required_version = ">= 0.13"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">=2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">=3.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.16.0"
    }
    # vault = {
    #   source  = "hashicorp/vault"
    #   version = ">= 3.0.0"
    # }
    # keycloak = {
    #   source  = "mrparkers/keycloak"
    #   version = ">= 3.0.0"
    # }
  }
}

# locals {
#   vault_root_token  = var.vault_root_token
#   keycloak_user     = var.keycloak_user
#   keycloak_password = var.keycloak_password
# }

# provider "vault" {
# #  address = "http://localhost:8200"
#   address = var.vault_url
#   token   = local.vault_root_token
# }

# provider "keycloak" {
#   client_id = "admin-cli"
#   username  = local.keycloak_user
#   password  = local.keycloak_password
#   base_path = ""
#   url       = "http://localhost:8080"
# }
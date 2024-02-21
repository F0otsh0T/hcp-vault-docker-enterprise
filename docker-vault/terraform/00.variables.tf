# 00.variables.tf

# variable "" {
#     type = string
#     description = ""
#     sensitive = false
#     default = ""
# }

################################################
# VAULT VARIABLES

variable "vault_url" {
  type        = string
  description = "Vault URL"
  sensitive   = false
  default     = "http://localhost:8200"
}

variable "vault_license" {
  type        = string
  description = "Vault Enterprise License"
  sensitive   = true
  default     = ""
}

variable "vault_root_token" {
  type        = string
  description = "Vault Root Token"
  sensitive   = true
  default     = ""
}

variable "container_image_vault" {
  type        = string
  description = "Specify the image for your Vault Container"
  sensitive   = false
  /* default     = "hashicorp/vault" */
  default = "hashicorp/vault-enterprise"
}

variable "container_tag_vault" {
  type        = string
  description = "Specify the version or tag for your Vault Container"
  sensitive   = false
  #default     = ""
  default = "1.15.5-ent"
}

variable "container_name_vault_s1" {
  type        = string
  description = "Specify name for your Vault Container"
  sensitive   = false
  default     = "vault_s1"
}

variable "container_name_vault_s2" {
  type        = string
  description = "Specify name for your Vault Container"
  sensitive   = false
  default     = "vault_s2"
}

variable "container_name_vault_s3" {
  type        = string
  description = "Specify name for your Vault Container"
  sensitive   = false
  default     = "vault_s3"
}

variable "path_vault_s1_config" {
  type        = string
  description = "Specify path on local disk to mount Vault Container /vault/config"
  sensitive   = false
  default     = "/var/tmp/volume/vault-ent/vault_s1/config"
}

variable "path_vault_s1_data" {
  type        = string
  description = "Specify path on local disk to mount Vault Container /vault/data"
  sensitive   = false
  default     = "/var/tmp/volume/vault-ent/vault_s1/data"
}

variable "path_vault_s2_config" {
  type        = string
  description = "Specify path on local disk to mount Vault Container /vault/config"
  sensitive   = false
  default     = "/var/tmp/volume/vault-ent/vault_s2/config"
}

variable "path_vault_s2_data" {
  type        = string
  description = "Specify path on local disk to mount Vault Container /vault/data"
  sensitive   = false
  default     = "/var/tmp/volume/vault-ent/vault_s2/data"
}

variable "path_vault_s3_config" {
  type        = string
  description = "Specify path on local disk to mount Vault Container /vault/config"
  sensitive   = false
  default     = "/var/tmp/volume/vault-ent/vault_s3/config"
}

variable "path_vault_s3_data" {
  type        = string
  description = "Specify path on local disk to mount Vault Container /vault/data"
  sensitive   = false
  default     = "/var/tmp/volume/vault-ent/vault_s3/data"
}

variable "path_vault_log" {
  type        = string
  description = "Specify path on local disk to mount **SHARED** Vault Container /var/log/vault"
  sensitive   = false
  default     = "/var/tmp/volume/vault-ent/log"
}

variable "docker_port_internal_vault" {
  type        = number
  description = "Specify Vault Internal Port Number"
  sensitive   = false
  default     = "8200"
}

variable "docker_port_external_vault_s1" {
  type        = number
  description = "Specify Vault S1 External Port Number"
  sensitive   = false
  default     = "8200"
}

variable "docker_port_external_vault_s2" {
  type        = number
  description = "Specify Vault S2 External Port Number"
  sensitive   = false
  default     = "28200"
}

variable "docker_port_external_vault_s3" {
  type        = number
  description = "Specify Vault S3 External Port Number"
  sensitive   = false
  default     = "38200"
}

variable "docker_restart_vault" {
  type        = string
  description = "Specify Vault Docker Restart Policy"
  sensitive   = false
  default     = "unless-stopped"
  validation {
    condition     = contains(["no", "on-failure", "always", "unless-stopped"], var.docker_restart_vault)
    error_message = "Value must be no, on-failure, always, unless-stopped."
  }
}

################################################
# KEYCLOAK VARIABLES

variable "keycloak_url" {
  type        = string
  description = "KeyCloak URL"
  sensitive   = false
  default     = "http://localhost:8080"
}

variable "keycloak_user" {
  type        = string
  description = "KeyCloak User"
  sensitive   = false
  default     = "admin"
}

variable "keycloak_password" {
  type        = string
  description = "KeyCloak Password"
  sensitive   = true
  default     = ""

}


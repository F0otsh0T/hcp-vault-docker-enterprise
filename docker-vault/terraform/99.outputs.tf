# 99.outputs.tf

# output "" {
#     value = 
# }

################################################
# DOCKER IMAGE - VAULT
################################################

output "container_image_vault_id" {
  value = docker_image.vault-ent.id
}

output "container_image_vault_name" {
  value = docker_image.vault-ent.name
}

################################################
# NETWORK
################################################

output "network_name" {
  value = docker_network.vault-ent-network.name
}

output "network_id" {
  value = docker_network.vault-ent-network.id
}

output "network_ipam" {
  value = docker_network.vault-ent-network.ipam_config
}

################################################
# VAULT INSTANCES
################################################

output "container_name_vault_s1" {
  value = docker_container.vault_s1.name
}

output "container_ip_vault_s1" {
  value = docker_container.vault_s1.network_data.0.ip_address
}

output "container_port_internal_vault_s1" {
  value = docker_container.vault_s1.ports.0.internal
}

output "container_port_external_vault_s1" {
  value = docker_container.vault_s1.ports.0.external
}


output "container_name_vault_s2" {
  value = docker_container.vault_s2.name
}

output "container_ip_vault_s2" {
  value = docker_container.vault_s2.network_data.0.ip_address
}

output "container_port_internal_vault_s2" {
  value = docker_container.vault_s2.ports.0.internal
}

output "container_port_external_vault_s2" {
  value = docker_container.vault_s2.ports.0.external
}

output "container_name_vault_s3" {
  value = docker_container.vault_s3.name
}

output "container_ip_vault_s3" {
  value = docker_container.vault_s3.network_data.0.ip_address
}

output "container_port_internal_vault_s3" {
  value = docker_container.vault_s3.ports.0.internal
}

output "container_port_external_vault_s3" {
  value = docker_container.vault_s3.ports.0.external
}



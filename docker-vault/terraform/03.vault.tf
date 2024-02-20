# 03.vault.tf

resource "docker_image" "vault-ent" {
  name         = "${var.container_image_vault}:${var.container_tag_vault}"
  keep_locally = true
}

resource "docker_container" "vault_s1" {
  depends_on = [
    docker_network.vault-ent-network#,
    # docker_container.splunk
  ]
  image = docker_image.vault-ent.latest
  name  = var.container_name_vault_s1
  capabilities {
    add = ["IPC_LOCK"]
  }
  networks_advanced {
    name         = docker_network.vault-ent-network.name
    aliases      = ["vault_s1"]
    ipv4_address = "10.88.0.18"
  }
  ports {
    internal = var.docker_port_internal_vault
    external = var.docker_port_external_vault_s1
  }
  restart = var.docker_restart_vault
  volumes {
    host_path = dirname(local_file.vault_s1-config.filename)
    #host_path      = var.path_vault_s1_config
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault_s1-config"
  }
  volumes {
    host_path = dirname(local_file.vault_s1-ipconfig.filename)
    #host_path      = var.path_vault_s1_config
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault_s1-ipconfig"
  }
  volumes {
    #host_path      = dirname(local_file.vault_s1-data.filename)
    container_path = "/vault/data"
  }
  volumes {
    host_path      = dirname(local_file.vault_s1-license.filename)
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault-license"
  }
  volumes {
    host_path      = dirname(local_file.vault_s1-log.filename)
    container_path = "/var/log/vault"
  }
  entrypoint = [
    "vault",
    "server",
    "-config=/vault/config"
  ]
}

resource "docker_container" "vault_s2" {
  depends_on = [
    docker_network.vault-ent-network#,
#    docker_container.splunk
  ]
  image = docker_image.vault-ent.latest
  name  = var.container_name_vault_s2
  capabilities {
    add = ["IPC_LOCK"]
  }
  networks_advanced {
    name         = docker_network.vault-ent-network.name
    aliases      = ["vault_s2"]
    ipv4_address = "10.88.0.28"
  }
  ports {
    internal = var.docker_port_internal_vault
    external = var.docker_port_external_vault_s2
  }
  restart = var.docker_restart_vault
  volumes {
    host_path = dirname(local_file.vault_s2-config.filename)
    #host_path      = var.path_vault_s2_config
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault_s2-config"
  }
  volumes {
    host_path = dirname(local_file.vault_s2-ipconfig.filename)
    #host_path      = var.path_vault_s2_config
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault_s2-ipconfig"
  }
  volumes {
    #host_path      = dirname(local_file.vault_s2-data.filename)
    container_path = "/vault/data"
  }
  volumes {
    host_path      = dirname(local_file.vault_s2-license.filename)
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault-license"
  }
  volumes {
    host_path      = dirname(local_file.vault_s2-log.filename)
    container_path = "/var/log/vault"
  }
  entrypoint = [
    "vault",
    "server",
    "-config=/vault/config"
  ]
}

resource "docker_container" "vault_s3" {
  depends_on = [
    docker_network.vault-ent-network#,
#    docker_container.splunk
  ]
  image = docker_image.vault-ent.latest
  name  = var.container_name_vault_s3
  capabilities {
    add = ["IPC_LOCK"]
  }
  networks_advanced {
    name         = docker_network.vault-ent-network.name
    aliases      = ["vault_s3"]
    ipv4_address = "10.88.0.38"
  }
  ports {
    internal = var.docker_port_internal_vault
    external = var.docker_port_external_vault_s3
  }
  restart = var.docker_restart_vault
  volumes {
    host_path = dirname(local_file.vault_s3-config.filename)
    #host_path      = var.path_vault_s3_config
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault_s3-config"
  }
  volumes {
    host_path = dirname(local_file.vault_s3-ipconfig.filename)
    #host_path      = var.path_vault_s3_config
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault_s3-ipconfig"
  }
  volumes {
    #host_path      = dirname(local_file.vault_s3-data.filename)
    container_path = "/vault/data"
  }
  volumes {
    host_path      = dirname(local_file.vault_s3-license.filename)
    container_path = "/vault/config"
    #    volume_name = "vault-ent-vault-license"
  }
  volumes {
    host_path      = dirname(local_file.vault_s3-log.filename)
    container_path = "/var/log/vault"
  }
  entrypoint = [
    "vault",
    "server",
    "-config=/vault/config"
  ]
}

################################################







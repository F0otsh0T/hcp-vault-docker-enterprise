---
title: HashiCorp Vault Enterprise on Docker
description: Vault Enterprise Cluster on Docker
---

---
tags:
  - docker
  - arm64
  - hashicorp
  - hcp-vault
  - vault
  - hcp-terraform
  - terraform
  - raft
  - dr
  - tech
alias:
  - Vault Enterprise Raft Cluster
---

---
# INFRA // Vault Enterprise on Docker - Raft Cluster

Vault Enterprise Cluster with Raft Storage Backend on Docker.

## Introduction

Credit goes to ***[nicklhw@github](https://github.com/nicklhw)*** as these Terraform templates are based off ***[nicklhw's](https://github.com/nicklhw)*** design, research, and scripts to stand up a local Docker **VAULT** Enterprise Cluster.

This spins up:

- 3 Node (Container) Vault Cluster


## Basics

- HCLIC: You will need to provide your own Vault Enterprise License File
  - e.g. `~/docker-vault/terraform/data/vault/shared/vault.hclic`
- Network:
  - e.g. `~/docker-vault/terraform/01.network.tf`
- Storage:
  - e.g. `~/docker-vault/terraform/02.storaget.tf`

## Usage

- Spin up Vault
  ```shell
  # cd docker-vault
  # make -f Makefile vault-all
  ```
- Remove Vault
  ```shell
  # cd docker-vault
  # make -f Makefile clean-vault-all
  ```


## Files

```
.
├── LICENSE
├── README.md
├── assets
├── docker-vault
│   ├── Makefile
│   └── terraform
│       ├── 00.variables.tf
│       ├── 00.versions.tf
│       ├── 01.network.tf
│       ├── 02.storage.tf
│       ├── 03.vault.tf
│       ├── 99.outputs.tf
│       ├── data
│       │   ├── scripts
│       │   │   ├── api_addr.sh
│       │   │   ├── init.sh
│       │   │   ├── pass_insert.sh
│       │   │   ├── unseal-cli.sh
│       │   │   └── vault.json
│       │   └── vault
│       │       ├── shared
│       │       │   ├── licenseplaceholder
│       │       │   └── vault.hclic
│       │       ├── vault_s1
│       │       │   ├── addr.hcl
│       │       │   └── vault-server.hcl
│       │       ├── vault_s2
│       │       │   ├── addr.hcl
│       │       │   └── vault-server.hcl
│       │       └── vault_s3
│       │           ├── addr.hcl
│       │           └── vault-server.hcl
│       ├── terraform.tfstate
│       └── terraform.tfstate.backup
└── utility
```

## Requirements

- Docker
- Terraform
- jq
- GPG / PGP / Pass

## Providers

| Name | Version |
|------|---------|
| <a name="local"></a> [hashicorp/local](https://registry.terraform.io/providers/hashicorp/local) | >=2.1.0 |
| <a name="docker"></a> [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker) | >=2.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker.docker_container](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container) | resource |
| [docker.docker_image](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image) | resource |
| [docker.docker_network](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network) | resource |
| [local.local_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="path_vault_s1_config"></a> [path_vault_s1_config](#) | Specify path on local disk to mount Vault Container /vault/config |  | /var/tmp/volume/vault-ent/vault_s1/config | yes |
| <a name="path_vault_s1_data"></a> [path_vault_s1_data](#) | Specify path on local disk to mount Vault Container /vault/data |  | /var/tmp/volume/vault-ent/vault_s1/data | yes |
| <a name="path_vault_s2_config"></a> [path_vault_s2_config](#) | Specify path on local disk to mount Vault Container /vault/config |  | /var/tmp/volume/vault-ent/vault_s1/config | yes |
| <a name="path_vault_s2_data"></a> [path_vault_s2_data](#) | Specify path on local disk to mount Vault Container /vault/data |  | /var/tmp/volume/vault-ent/vault_s1/data | yes |
| <a name="path_vault_s3_config"></a> [path_vault_s3_config](#) | Specify path on local disk to mount Vault Container /vault/config |  | /var/tmp/volume/vault-ent/vault_s1/config | yes |
| <a name="path_vault_s3_data"></a> [path_vault_s3_data](#) | Specify path on local disk to mount Vault Container /vault/data |  | /var/tmp/volume/vault-ent/vault_s1/data | yes |
| <a name="path_vault_log"></a> [path_vault_log](#) | Specify path on local disk to mount **SHARED** Vault Container /var/log/vault |  | /var/tmp/volume/vault-ent/log | yes |
| <a name="container_image_vault"></a> [container_image_vault](#) | Image Name of Vault Container |  | hashicorp/vault-enterprise | yes |
| <a name="container_tag_vault"></a> [container_tag_vault](#) | Image Tag of Vault Container |  | {{VAULT_VERSION}} | no |
| <a name="container_name_vault_s1"></a> [container_name_vault_s1](#) | Name of Vault Container |  | vault_s1 | yes |
| <a name="container_name_vault_s2"></a> [container_name_vault_s2](#) | Name of Vault Container |  | vault_s2 | yes |
| <a name="container_name_vault_s3"></a> [container_name_vault_s3](#) | Name of Vault Container |  | vault_s3 | yes |
| <a name="docker_port_internal_vault"></a> [docker_port_internal_vault](#) | Internal Port for Vault Container |  | 8200 | no |
| <a name="docker_port_external_vault_s1"></a> [docker_port_external_vault_s1](#) | External Port for Vault S1 Container |  | 18200 | yes |
| <a name="docker_port_external_vault_s2"></a> [docker_port_external_vault_s2](#) | External Port for Vault S2 Container |  | 28200 | yes |
| <a name="docker_port_external_vault_s1"></a> [docker_port_external_vault_s3](#) | External Port for Vault S3 Container |  | 38200 | yes |
| <a name="docker_restart_vault"></a> [docker_restart_vault](#) | Restart Policy for Vault Container |  | unless-stopped | no |
| <a name="vault_root_token"></a> [vault_root_token](#) | Root Token for Vault Service |  |  | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="container_image_vault_id"></a> [container_image_vault_id](#) | n/a |
| <a name="network_name"></a> [network_name](#) | n/a |
| <a name="network_id"></a> [network_id](#) | n/a |
| <a name="network_ipam"></a> [network_ipam](#) | n/a |
| <a name="container_name_vault_s1"></a> [container_name_vault_s1](#) | n/a |
| <a name="container_name_vault_s2"></a> [container_name_vault_s2](#) | n/a |
| <a name="container_name_vault_s3"></a> [container_name_vault_s3](#) | n/a |
| <a name="container_ip_vault_s1"></a> [container_ip_vault_s1](#) | n/a |
| <a name="container_ip_vault_s2"></a> [container_ip_vault_s2](#) | n/a |
| <a name="container_ip_vault_s3"></a> [container_ip_vault_s3](#) | n/a |
| <a name="container_port_internal_vault_s1"></a> [container_port_internal_vault_s1](#) | n/a |
| <a name="container_port_internal_vault_s2"></a> [container_port_internal_vault_s2](#) | n/a |
| <a name="container_port_internal_vault_s3"></a> [container_port_internal_vault_s3](#) | n/a |
| <a name="container_port_external_vault_s1"></a> [container_port_external_vault_s1](#) | n/a |
| <a name="container_port_external_vault_s2"></a> [container_port_external_vault_s2](#) | n/a |
| <a name="container_port_external_vault_s3"></a> [container_port_external_vault_s3](#) | n/a |


## Appendix
- 

## References
- https://www.terraform.io/cli/run
- https://learn.hashicorp.com/collections/terraform/docker-get-started
- https://registry.terraform.io/providers/kreuzwerker/docker
- https://hub.docker.com/_/vault
- https://github.com/nicklhw/vault-docker-compose/tree/master/docker-compose




[[]]





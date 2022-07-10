terraform {
  required_providers {
    proxmox = {
      source = "registry.terraform.io/Telmate/proxmox"
      version = "2.9.10"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url = "https://bms-devops.ru:8006/api2/json"
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}

module "n1" {
    vmid = 201
    host_name = "n1"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}

module "n2" {
    vmid = 202
    host_name = "n2"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}

module "n3" {
    vmid = 203
    host_name = "n3"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}


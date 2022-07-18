terraform {
  required_providers {
    proxmox = {
      source = "registry.terraform.io/Telmate/proxmox"
      version = "2.9.10"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
    access_key = "access_key"
    secret_key = "secret_key"
    endpoint = "http://bms-devops.ru:9000"
    skip_credentials_validation = true
    force_path_style = true
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url = "https://bms-devops.ru:8006/api2/json"
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}

module "nginx" {
    vmid = 100
    host_name = "nginx"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}

module "www" {
    vmid = 101
    host_name = "www"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}

module "db1" {
    vmid = 102
    host_name = "db1"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}
module "db2" {
    vmid = 103
    host_name = "db2"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}

module "gitlab" {
    vmid = 104
    host_name = "gitlab"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}

module "mon" {
    vmid = 105
    host_name = "mon"

    source = "./modules/containers"
    domain = var.domain
    password = var.password
    ssh_public_keys = var.ssh_public_keys
}


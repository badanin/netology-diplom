terraform {
  required_providers {
    proxmox = {
      source = "registry.terraform.io/Telmate/proxmox"
      version = "2.9.10"
    }
  }
}

resource "proxmox_lxc" "lxc_containers" {
  # Параметры системы
  target_node = var.target_node
  ostemplate = "${var.storage}:vztmpl/${var.ostemplate}"

  # Общие параметры контейнера
  start = true
  onboot = true
  unprivileged = true
  features { nesting = true }
  
  # Параметры подключения
  password = var.password
  ssh_public_keys = var.ssh_public_keys
  
  # Параметры контейнера
  hostname = "${var.host_name}.${var.domain}"
  vmid = var.vmid
  cores = var.cores
  memory = var.memory
  swap = var.swap
  rootfs {
    storage = var.storage
    size = var.rootfs_size
  }

  # Параметры сети
  searchdomain = var.domain
  nameserver = var.nameserver
  network {
    name = var.network_name
    bridge = var.network_bridge
    ip = "${var.network_subnet}${var.vmid}/${var.network_mask}"
    gw = var.network_gw
  }

  # provisioner "local-exec" {
  #   command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -e 'ansible_ssh_port=222' -i '${var.domain},' ../../ansible/s3/site.yml"
  # }
  
}


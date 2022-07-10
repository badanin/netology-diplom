terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.10"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url = "https://bms-devops.ru:8006/api2/json"
  # pm_user = var.pve_pm_user
  # pm_password = var.pve_pm_password
  pm_api_token_id = var.pve_pm_api_token_id
  pm_api_token_secret = var.pve_pm_api_token_secret
}

resource "proxmox_lxc" "s3" {
  hostname = "s3.bms-devops.ru"
  start = true
  onboot = true
  unprivileged = true
  
  password = var.lxc_pass
  ssh_public_keys = var.lxc_ssh_public_key
  
  vmid = var.lxc_vmid
  target_node = "pve"
  ostemplate = "local-btrfs:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst"
  cores = 1
  memory = 512
  swap = 0

  features {
    nesting = true
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "172.16.0.${var.lxc_vmid}/24"
    gw = "172.16.0.11"
  }

  rootfs {
    storage = "local-btrfs"
    size = "4G"
  }

  # mountpoint {
  #   key = "0"
  #   slot = 0
  #   storage = "/data/s3"
  #   volume = "/data/s3"
  #   mp = "/data"
  #   size = "1G"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "echo Done!"
  #     ]

  #   connection {
  #     host = var.domain
  #     type = "ssh"
  #     user = "root"
  #     port = "222"
  #     private_key = file(var.private_key)
  #   }
  # }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -e 'ansible_ssh_port=222' -i '${var.domain},' ../../ansible/s3/site.yml"
  }
  
}

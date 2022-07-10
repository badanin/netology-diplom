variable "lxc_pass" {
  description = "Password for LXC root"
  type = string
  sensitive = true
}

variable "bms_private_key" {
  description = "BMS private for LXC root"
  sensitive = true
}

variable "lxc_ssh_public_key" {
  description = "Public key for LXC root"
  sensitive = true
}

# variable "pve_pm_user" {
#   description = "PVE username"
#   sensitive = true
# }

# variable "pve_pm_password" {
#   description = "PVE password"
#   sensitive = true
# }

variable "pve_pm_api_token_id" {
  description = "PVE username id"
  sensitive = true
}

variable "pve_pm_api_token_secret" {
  description = "PVE token"
  sensitive = true
}

variable "lxc_vmid" {
    description = "VMID for LXC"
    default = 199
}

variable "domain" {
  description = "Domain for all"
  default = "bms-devops.ru"
}

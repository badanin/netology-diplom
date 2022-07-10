# Параметры системы
variable "target_node" { default = "pve" }
variable "storage" { default = "local-btrfs" }
variable "ostemplate" { default = "debian-11-standard_11.3-1_amd64.tar.zst" }

# Параметры подключения
variable "password" { default = "password" }
variable "ssh_public_keys" { default = "" }

# Параметры контейнера
variable "host_name" { default = "node" }
variable "domain" { default = "domain" }
variable "vmid" { default = "0" }
variable "cores" { default = "1" }
variable "memory" { default = "512" }
variable "swap" { default = "0" }
variable "rootfs_size" { default = "2G" }

# Параметры сети
variable "nameserver" { default = "172.16.0.11"}
variable "network_name" { default = "eth0" }
variable "network_bridge" { default = "vmbr0" }
variable "network_subnet" { default = "172.16.0." }
variable "network_mask" { default = "24" }
variable "network_gw" { default = "172.16.0.11" }

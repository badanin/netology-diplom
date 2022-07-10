variable "pm_api_token_id" { sensitive = true }
variable "pm_api_token_secret" { sensitive = true }

variable "domain" { default = "bms-devops.ru" }

variable "password" { sensitive = true }
variable "ssh_public_keys" { sensitive = true }

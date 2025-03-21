variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "rg-hybrid-vpn"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_password" {
  description = "Password for VM admin user"
  sensitive   = true
}
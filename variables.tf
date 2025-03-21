variable "location" {
  type        = string
  description = "Azure region for deployment"
  default     = "East US"
}

variable "resource_group_name" {
  type        = string
  description = "Azure resource group for all resources"
  default     = "rg-hybrid-vpn"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VMs"
  default     = "adminuser"
}

variable "admin_password" {
  type        = string
  description = "Admin password for VMs"
  sensitive   = true
}

variable "windows_vm_count" {
  default = 3
}

variable "redhat_vm_count" {
  default = 2
}
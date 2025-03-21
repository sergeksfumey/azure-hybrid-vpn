variable "location" {
  type        = string
  description = "Azure region for compute resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for compute resources"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where VMs will be deployed"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VMs"
}

variable "admin_password" {
  type        = string
  description = "Admin password for VMs"
  sensitive   = true
}


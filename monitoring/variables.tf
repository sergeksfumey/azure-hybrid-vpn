variable "location" {
  type        = string
  description = "Azure region for monitoring resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for monitoring resources"
}

variable "vm_ids" {
  type        = list(string)
  description = "List of VM resource IDs for monitoring setup"
}


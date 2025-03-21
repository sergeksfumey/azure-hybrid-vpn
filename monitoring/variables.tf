variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "jumpbox_vm_id" {
  type        = string
  description = "Jumpbox VM ID"
}

variable "windows_vm_ids" {
  type        = list(string)
  description = "List of Windows VM IDs"
}

variable "windows_vm_count" {
  type        = number
  description = "Number of Windows Server VMs"
}

variable "redhat_vm_ids" {
  type        = list(string)
  description = "List of Red Hat VM IDs"
}

variable "redhat_vm_count" {
  type        = number
  description = "Number of Red Hat VMs"
}

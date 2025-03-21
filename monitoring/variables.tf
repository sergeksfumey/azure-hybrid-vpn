variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "jumpbox_vm_id" {
  type        = string
}

variable "windows_vm_ids" {
  type        = list(string)
}

variable "redhat_vm_ids" {
  type        = list(string)
}

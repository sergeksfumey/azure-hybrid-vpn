output "jumpbox_vm_id" {
  value = azurerm_windows_virtual_machine.jumpbox.id
}

output "windows_vm_ids" {
  value = azurerm_windows_virtual_machine.windows_vm[*].id
}

output "redhat_vm_ids" {
  value = azurerm_linux_virtual_machine.rhel_vm[*].id
}

output "vm_ids" {
  value = concat(
    azurerm_windows_virtual_machine.windows_vm[*].id,
    azurerm_linux_virtual_machine.rhel_vm[*].id,
    [azurerm_windows_virtual_machine.jumpbox.id]
  )
}


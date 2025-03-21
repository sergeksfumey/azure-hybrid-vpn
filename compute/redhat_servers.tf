resource "azurerm_linux_virtual_machine" "rhel_vm" {
  count                 = 2
  name                  = "rhel-vm-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = "Standard_B2ms"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.rhel_nic[count.index].id]

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

output "vm_ids" {
  value = concat(azurerm_windows_virtual_machine.windows_vm[*].id, azurerm_linux_virtual_machine.rhel_vm[*].id)
}

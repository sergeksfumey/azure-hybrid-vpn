resource "azurerm_windows_virtual_machine" "jumpbox" {
  name                  = "win11-jumpbox"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = "Standard_B2ms"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.jumpbox_nic.id]

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-21h2-pro"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

output "jumpbox_public_ip" {
  value = azurerm_public_ip.jumpbox_pip.ip_address
}

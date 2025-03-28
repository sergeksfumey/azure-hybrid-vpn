# Network Interface for Windows Server VMs
resource "azurerm_network_interface" "windows_nic" {
  count               = 3
  name                = "windows-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Windows Server 2022 VMs
resource "azurerm_windows_virtual_machine" "windows_vm" {
  count                 = 3
  name                  = "win-server-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = "Standard_B2ms"
  admin_username        = var.admin_username
  admin_password        = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.windows_nic[count.index].id
  ]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

# Public IP for Jumpbox
resource "azurerm_public_ip" "jumpbox_pip" {
  name                = "jumpbox-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Network Interface for Jumpbox
resource "azurerm_network_interface" "jumpbox_nic" {
  name                = "jumpbox-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jumpbox_pip.id
  }
}

# Jumpbox Virtual Machine
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

# Output Public IP of Jumpbox
output "jumpbox_public_ip" {
  value = azurerm_public_ip.jumpbox_pip.ip_address
}

# Network Interface for RedHat VMs
resource "azurerm_network_interface" "rhel_nic" {
  count               = 2
  name                = "rhel-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# RedHat Linux VMs
resource "azurerm_linux_virtual_machine" "rhel_vm" {
  count                 = 2
  name                  = "rhel-vm-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = "Standard_B2ms"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.rhel_nic[count.index].id
  ]

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

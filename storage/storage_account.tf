resource "azurerm_storage_account" "storage" {
  name                     = "hybridstorage${random_id.storage.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_id" "storage" {
  byte_length = 4
}

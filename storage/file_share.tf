resource "azurerm_storage_share" "share" {
  name                 = "sharedfiles"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 100
}

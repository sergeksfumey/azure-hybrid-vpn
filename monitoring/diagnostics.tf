resource "azurerm_log_analytics_workspace" "log" {
  name                = "log-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "vm_diagnostics" {
  for_each = toset(var.vm_ids)

  name                       = "vm-diagnostics-${each.key}"
  target_resource_id         = each.key
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  log {
    category = "Administrative"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

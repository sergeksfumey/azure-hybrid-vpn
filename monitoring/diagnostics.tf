# Log Analytics Workspace for monitoring diagnostics
resource "azurerm_log_analytics_workspace" "log" {
  name                = "log-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Diagnostic settings for all VMs using count to handle dynamic VM IDs clearly
resource "azurerm_monitor_diagnostic_setting" "vm_diagnostics" {
  count = length(var.vm_ids)

  name                       = "vm-diagnostics-${count.index + 1}"
  target_resource_id         = var.vm_ids[count.index]
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

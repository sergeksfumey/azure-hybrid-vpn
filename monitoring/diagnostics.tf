resource "azurerm_monitor_diagnostic_setting" "vm_diagnostics" {
  for_each = toset(var.vm_ids)

  name                       = "vm-diagnostics-${basename(each.key)}"
  target_resource_id         = each.key
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

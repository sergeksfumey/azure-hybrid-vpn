# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log" {
  name                = "log-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Diagnostic setting for the Jumpbox VM explicitly
resource "azurerm_monitor_diagnostic_setting" "jumpbox_diagnostics" {
  name                       = "jumpbox-diagnostics"
  target_resource_id         = module.compute.jumpbox_vm_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# Diagnostic settings for Windows Servers explicitly
resource "azurerm_monitor_diagnostic_setting" "windows_diagnostics" {
  count                      = length(module.compute.windows_vm_ids)
  name                       = "windows-server-${count.index + 1}-diagnostics"
  target_resource_id         = module.compute.windows_vm_ids[count.index]
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# Diagnostic settings for RedHat Servers explicitly
resource "azurerm_monitor_diagnostic_setting" "redhat_diagnostics" {
  count                      = length(module.compute.redhat_vm_ids)
  name                       = "redhat-server-${count.index + 1}-diagnostics"
  target_resource_id         = module.compute.redhat_vm_ids[count.index]
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

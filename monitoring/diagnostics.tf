# Log Analytics Workspace for all diagnostics
resource "azurerm_log_analytics_workspace" "log" {
  name                = "log-analytics-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Diagnostics for Jumpbox (Windows 11)
resource "azurerm_monitor_diagnostic_setting" "jumpbox_diagnostics" {
  name                       = "jumpbox-diagnostics"
  target_resource_id         = var.jumpbox_vm_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# Diagnostics for Windows Server 2022 VMs
resource "azurerm_monitor_diagnostic_setting" "windows_diagnostics" {
  count                      = var.windows_vm_count
  name                       = "windows-vm-${count.index + 1}-diagnostics"
  target_resource_id         = var.windows_vm_ids[count.index]
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# Diagnostics for Red Hat VMs
resource "azurerm_monitor_diagnostic_setting" "redhat_diagnostics" {
  count                      = var.redhat_vm_count
  name                       = "rhel-vm-${count.index + 1}-diagnostics"
  target_resource_id         = var.redhat_vm_ids[count.index]
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "Administrative"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

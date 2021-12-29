resource "azurerm_log_analytics_workspace" "webapplogs" {
  name                = "webapplogs"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
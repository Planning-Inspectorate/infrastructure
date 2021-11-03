resource "azurerm_application_insights" "appinsights" {
  name                = "${local.resource_name_prefix}-${var.app_insights_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
  tags                = local.common_tags
}

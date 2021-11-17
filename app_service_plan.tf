resource "azurerm_app_service_plan" "asp" {
  name                = "${local.resource_name_prefix}-${var.app_service_plan_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind = "Linux"
  reserved = true
  sku {
    tier = "Premium"
    size = "P1"
  }
  tags = local.common_tags
}

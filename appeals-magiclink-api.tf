resource "azurerm_app_service" "app_service6" {
  name                = "${local.resource_name_prefix}-${var.app_service_name6}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  identity {
    type = "SystemAssigned"
  }

   site_config {
    linux_fx_version = "DOCKER|appsvcsample/static-site:latest"
    always_on        = "true"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                                   = azurerm_application_insights.appinsights.instrumentation_key

  }
  tags = local.common_tags
}

# resource "azurerm_app_service_virtual_network_swift_connection" "connect6" {
#   app_service_id = azurerm_app_service.app_service6.id
#   subnet_id      = azurerm_subnet.subnet.id
# }

resource "azurerm_private_endpoint" "privateendpoint2" {
  name                = "appealreplyserviceendpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name = "arsconnection"
    private_connection_resource_id = azurerm_app_service.app_service6.id
    subresource_names = ["sites"]
    is_manual_connection = false
  }
}

resource "azurerm_app_service" "appservice4" {
  name                = "${local.resource_name_prefix}-${var.app_service_name4}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    dotnet_framework_version = "v5.0"
    scm_type                 = "LocalGit"
  }
}

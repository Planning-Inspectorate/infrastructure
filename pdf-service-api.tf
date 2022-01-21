resource "azurerm_app_service" "pdf_service_api" {
  name                = "${local.resource_name_prefix}-${var.pdf_service_api}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  # identity {
  #   type = "SystemAssigned"
  # }

  site_config {
    linux_fx_version = "DOCKER|appsvcsample/static-site:latest"
    always_on        = "true"
  }
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"          = azurerm_application_insights.appinsights.instrumentation_key
    "DOCKER_ENABLE_CI"                        = "true"
    "DOCKER_REGISTRY_SERVER_PASSWORD"         = data.azurerm_key_vault_secret.docker-reg-server-pwd.value
    "DOCKER_REGISTRY_SERVER_URL"              = data.azurerm_key_vault_secret.docker-reg-server-url.value
    "DOCKER_REGISTRY_SERVER_USERNAME"         = data.azurerm_key_vault_secret.docker-reg-server-usr.value
    "DOCS_API_PATH"                           = "/opt/app/api"
    "GOTENBERG_URL"                           = "http://gotenberg:4000"
    "LOGGER_LEVEL"                            = "debug"
    "NODE_ENV"                                = "production"
    "SERVER_PORT"                             = "3000"
    "SERVER_SHOW_ERRORS"                      = "true"
    "SERVER_TERMINATION_GRACE_PERIOD_SECONDS" = "0"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"      = "28"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"     = "false"




  }
  tags = local.common_tags

}

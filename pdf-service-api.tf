resource "azurerm_app_service" "appservice4" {
  name                = "${local.resource_name_prefix}-${var.app_service_name4}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|appsvcsample/static-site:latest"
    always_on        = "true"
  }
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"          = azurerm_application_insights.appinsights.instrumentation_key
    "DOCKER_ENABLE_CI"                        = "true"
    "DOCKER_REGISTRY_SERVER_PASSWORD"         = "a2oJipgw82NsbjA=9JhYuGy5pI9s6pSY"
    "DOCKER_REGISTRY_SERVER_URL"              = "https://pinscommonukscontainers3887default.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"         = "pinscommonukscontainers3887default"
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

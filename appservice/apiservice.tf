
resource "azurerm_application_insights" "apiinsigts" {
  name                = "applications-service-api"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  application_type    = "web"
}

resource "azurerm_app_service" "apiapp" {
  name                = "applications-service-api-2"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  app_service_plan_id = azurerm_app_service_plan.AppSrvPlan.id

  # Do not attach Storage by default
  app_settings = {
    APP_APPLICATIONS_BASE_URL  = "https://applications-service-web-app.azurewebsites.net"
    APPINSIGHTS_INSTRUMENTATIONKEY  = azurerm_application_insights.apiinsigts.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=${azurerm_application_insights.apiinsigts.instrumentation_key};IngestionEndpoint=${var.IngestionEndpoint}"
    ApplicationInsightsAgent_EXTENSION_VERSION  = "~3"
    DOCKER_REGISTRY_SERVER_URL      = var.Docker_Registry_Server_URL
    DOCKER_REGISTRY_SERVER_USERNAME = data.azurerm_key_vault_secret.DockerUserName.value
    DOCKER_REGISTRY_SERVER_PASSWORD = data.azurerm_key_vault_secret.DockerUserPass.value
    ENCRYPTION_SECRET_KEY    = data.azurerm_key_vault_secret.EncryptionSecretKey.value
    FORMS_WEB_APP_HOST  = var.FORMS_WEB_APP_HOST
    HAVING_YOUR_SAY_URL  = var.HAVING_YOUR_SAY_URL
    LOGGER_LEVEL = var.LOGGER_LEVEL
    MAGIC_LINK_DOMAIN  = var.MAGIC_LINK_DOMAIN
    MYSQL_DATABASE  = var.MYSQL_DATABASE
    MYSQL_DIALECT  = var.MYSQL_DIALECT
    MYSQL_HOST  = var.MYSQL_HOST
    MYSQL_PASSWORD = data.azurerm_key_vault_secret.MysqlPassword.value
    MYSQL_PORT  = var.MYSQL_PORT
    MYSQL_USERNAME  = data.azurerm_key_vault_secret.MysqlUserName.value
    NODE_ENV  = var.NODE_ENV
    PRELIMINARY_MEETING_URL = var.PRELIMINARY_MEETING_URL
    SERVER_PORT = var.SERVER_PORT
    SERVER_SHOW_ERRORS  = var.SERVER_SHOW_ERRORS
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS = var.SERVER_TERMINATION_GRACE_PERIOD_SECONDS
    SRV_NOTIFY_API_KEY  = data.azurerm_key_vault_secret.SrvNotifyKey.value
    TRIALIST_DATA_PATH  = var.TRIALIST_DATA_PATH
    WEBSITE_HTTPLOGGING_RETENTION_DAYS  = var.WEBSITE_HTTPLOGGING_RETENTION_DAYS
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.WEBSITES_ENABLE_APP_SERVICE_STORAGE
    XDT_MicrosoftApplicationInsights_Mode = var.XDT_MicrosoftApplicationInsights_Mode
  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|appsvcsample/static-site:latest"
    always_on        = "true"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_application_insights.apiinsigts]
}

resource "azurerm_app_service_virtual_network_swift_connection" "apiswiftnetwork" {
  app_service_id = azurerm_app_service.apiapp.id
  subnet_id      = azurerm_subnet.AppSubnets.id
  depends_on = [azurerm_subnet.AppSubnets]
}
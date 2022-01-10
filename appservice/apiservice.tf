
resource "azurerm_application_insights" "apiinsigts" {
  name                = "pinsapiinsights"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  application_type    = "web"
}

resource "azurerm_app_service" "apiapp" {
  name                = "pinsapiapp"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  app_service_plan_id = azurerm_app_service_plan.AppSrvPlan.id

  # Do not attach Storage by default
  app_settings = {
    APP_APPLICATIONS_BASE_URL  = "https://applications-service-web-app.azurewebsites.net"
    APPINSIGHTS_INSTRUMENTATIONKEY  = azurerm_application_insights.apiinsigts.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = InstrumentationKey=azurerm_application_insights.apiinsigts.instrumentation_key;IngestionEndpoint=https://uksouth-1.in.applicationinsights.azure.com/
    ApplicationInsightsAgent_EXTENSION_VERSION  = "~3"
    DOCKER_REGISTRY_SERVER_URL      = "https://pinscommonukscontainers3887default.azurecr.io"
    DOCKER_REGISTRY_SERVER_USERNAME = "pinscommonukscontainers3887default"
    DOCKER_REGISTRY_SERVER_PASSWORD = "a2oJipgw82NsbjA=9JhYuGy5pI9s6pSY"
    ENCRYPTION_SECRET_KEY    = "x!A%C*F-JaNdRgUkXp2s5v8y/B?E(G+K"
    FORMS_WEB_APP_HOST  = "51.104.28.75"
    HAVING_YOUR_SAY_URL  = "https://applications-service-web-app.azurewebsites.net/"
    LOGGER_LEVEL = "info"
    MAGIC_LINK_DOMAIN  = "https://applications-service-web-app.azurewebsites.net/"
    MYSQL_DATABASE  = "ipclive"
    MYSQL_DIALECT  = "mysql"
    MYSQL_HOST  = "10.222.0.6"
    MYSQL_PASSWORD = "YuRgetM32do?"
    MYSQL_PORT  = "3306"
    MYSQL_USERNAME  = "ipc"
    NODE_ENV  = "development"
    PRELIMINARY_MEETING_URL = "https://applications-service-web-app.azurewebsites.net/"
    SERVER_PORT = "3000"
    SERVER_SHOW_ERRORS  = "true"
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS = "0"
    SRV_NOTIFY_API_KEY  = "applicationsservice-9b89eb93-3071-432c-9c6b-4e07dbda9071-101fa83a-8d08-40af-92b6-246b95074e5a"
    TRIALIST_DATA_PATH  = "/opt/app/data/trialists.json"
    WEBSITE_HTTPLOGGING_RETENTION_DAYS  = "7"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    XDT_MicrosoftApplicationInsights_Mode = "default"
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
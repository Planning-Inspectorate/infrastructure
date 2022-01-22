
resource "azurerm_application_insights" "webinsigts" {
  name                = "applications-service-web-app"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  application_type    = "web"
}

resource "azurerm_app_service_plan" "AppSrvPlan" {
  name                = var.AppSrvPlan
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "applications-service-web-app-2"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  app_service_plan_id = azurerm_app_service_plan.AppSrvPlan.id

  # Do not attach Storage by default
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY  = azurerm_application_insights.webinsigts.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=${azurerm_application_insights.webinsigts.instrumentation_key};IngestionEndpoint=https://uksouth-1.in.applicationinsights.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION  = "~3"
    DOCKER_CUSTOM_IMAGE_NAME        = "pinscommonukscontainers3887default.azurecr.io/applications-forms-web-app:latest"
    DOCKER_REGISTRY_SERVER_URL      = "https://pinscommonukscontainers3887default.azurecr.io"
    DOCKER_REGISTRY_SERVER_USERNAME = data.azurerm_key_vault_secret.DockerUserName.value
    DOCKER_REGISTRY_SERVER_PASSWORD = data.azurerm_key_vault_secret.DockerUserPass.value
    APPLICATIONS_SERVICE_API_URL    = "https://applications-service-api.azurewebsites.net"
    APPLICATIONS_SERVICE_API_TIMEOUT  = "10000"
    HOST_URL  = "https://applications-service-web-app.azurewebsites.net"
    SESSION_KEY = data.azurerm_key_vault_secret.DockerSessionKey.value
    SUBDOMAIN_OFFSET  = "3"
    USE_SECURE_SESSION_COOKIES  = "false"
    WEBSITE_HTTPLOGGING_RETENTION_DAYS  = "3"
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

  depends_on = [azurerm_application_insights.webinsigts]
}

resource "azurerm_app_service_virtual_network_swift_connection" "webswiftnetwork" {
  app_service_id = azurerm_app_service.webapp.id
  subnet_id      = azurerm_subnet.AppSubnets.id
  depends_on = [azurerm_subnet.AppSubnets]
}
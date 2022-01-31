
resource "azurerm_application_insights" "webinsigts" {
  name                = var.App_Insight_Name
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
  name                = var.App_Service_Name
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  app_service_plan_id = azurerm_app_service_plan.AppSrvPlan.id

  # Do not attach Storage by default
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY  = azurerm_application_insights.webinsigts.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=${azurerm_application_insights.webinsigts.instrumentation_key};IngestionEndpoint=${var.IngestionEndpoint}"
    ApplicationInsightsAgent_EXTENSION_VERSION  = var.ApplicationInsightsAgent_EXTENSION_VERSION
    DOCKER_CUSTOM_IMAGE_NAME        = "pinscommonukscontainers3887default.azurecr.io/applications-forms-web-app:latest"
    DOCKER_REGISTRY_SERVER_URL      = var.Docker_Registry_Server_URL
    DOCKER_REGISTRY_SERVER_USERNAME = var.Docker_Registry_Server_Username
    DOCKER_REGISTRY_SERVER_PASSWORD = var.Docker_Registry_Server_Password
    APPLICATIONS_SERVICE_API_URL    = var.Appliction_Service_API_URL
    APPLICATIONS_SERVICE_API_TIMEOUT  = var.APPLICATIONS_SERVICE_API_TIMEOUT
    HOST_URL  = var.HOST_URL
    SESSION_KEY = var.data.azurerm_key_vault_secret.DockerSessionKey.value
    SUBDOMAIN_OFFSET  = var.SUBDOMAIN_OFFSET
    USE_SECURE_SESSION_COOKIES  = var.USE_SECURE_SESSION_COOKIES
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

  depends_on = [azurerm_application_insights.webinsigts]
}

resource "azurerm_app_service_virtual_network_swift_connection" "webswiftnetwork" {
  app_service_id = azurerm_app_service.webapp.id
  subnet_id      = azurerm_subnet.AppSubnets.id
  depends_on = [azurerm_subnet.AppSubnets]
}
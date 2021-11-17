resource "azurerm_app_service" "app_service" {
  name                = "${local.resource_name_prefix}-${var.app_service_name1}"
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
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.appinsights.instrumentation_key
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "disabled"
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = "disabled"
    "APPLICATIONINSIGHTS_CONFIGURATION_CONTENT"       = ""
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = "InstrumentationKey=70d6e1cf-c440-4460-b4c1-4f1a422c2825;IngestionEndpoint=https://uksouth-1.in.applicationinsights.azure.com/"
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "disabled"
    "BLOB_STORAGE_CONNECTION_STRING"                  = "DefaultEndpointsProtocol=https;AccountName=pinsuksdocs1905dev;AccountKey=zMrTRn+E+ZpvBVRozhMHuzqmW0aNNF5rG4uOhoaMARJFuoPqfCLT405jLN06oxylrFB3dp0xFT/r+rArBZyg/g==;EndpointSuffix=core.windows.net"
    "DiagnosticServices_EXTENSION_VERSION"            = "disabled"
    "DOCKER_ENABLE_CI"                                = "true"
    "DOCKER_REGISTRY_SERVER_PASSWORD"                 = "a2oJipgw82NsbjA=9JhYuGy5pI9s6pSY"
    "DOCKER_REGISTRY_SERVER_URL"                      = "https://pinscommonukscontainers3887default.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"                 = "pinscommonukscontainers3887default"
    "DOCS_API_PATH"                                   = "/opt/app/api"
    "FILE_MAX_SIZE_IN_BYTES"                          = "15000000"
    "FILE_UPLOAD_PATH"                                = "/tmp/upload"
    "InstrumentationEngine_EXTENSION_VERSION"         = "disabled"
    "LOGGER_LEVEL"                                    = "debug"
    "MONGODB_AUTO_INDEX"                              = "true"
    "MONGODB_DB_NAME"                                 = "document-service-api"
    "MONGODB_URL"                                     = "mongodb://pins-uks-mongodb-9475-dev:u5K6MuXfg1SjUF2iorpYua1j8xFcvl2x566WF9aMzNZpDYw52HGrZd9djdOLGfEui7WZrnJ1l9En5n1NwgAKjA==@pins-uks-mongodb-9475-dev.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@pins-uks-mongodb-9475-dev@"
    "NODE_ENV"                                        = "production"
    "SERVER_PORT"                                     = "4000",
    "SERVER_SHOW_ERRORS"                              = "true"
    "SnapshotDebugger_EXTENSION_VERSION"              = "disabled"
    "STORAGE_CONTAINER_NAME"                          = "uploads"
    "STORAGE_UPLOAD_MAX_ATTEMPTS"                     = "3"
    "STORAGE_UPLOAD_QUERY_LIMIT"                      = "5"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"              = "28"
    "WEBSITES_CONTAINER_START_TIME_LIMIT"             = "50000"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"             = "false"
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = "disabled"
    "XDT_MicrosoftApplicationInsights_Mode"           = "default"
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = "disabled"
  }
  tags = local.common_tags
}

# resource "azurerm_app_service_virtual_network_swift_connection" "connect1" {
#   app_service_id = azurerm_app_service.app_service.id
#   subnet_id      = azurerm_subnet.subnet.id
# }


resource "azurerm_private_endpoint" "privateendpoint" {
  name                = "appealdocumentserviceendpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name = "adsconnection"
    private_connection_resource_id = azurerm_app_service.app_service.id
    subresource_names = ["sites"]
    is_manual_connection = false
  }
}
resource "azurerm_app_service" "app_service3" {
  name                = "${local.resource_name_prefix}-${var.app_service_name3}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  identity {
    type = "SystemAssigned"
  }

  site_config {
    dotnet_framework_version = "v5.0"
    scm_type                 = "LocalGit"

  }

  app_settings = {
    "ALLOW_APPEAL_REPLY_CREATE"          = "true"
    "APPEAL_REPLY_SERVICE_API_TIMEOUT"   = "10000"
    "APPEAL_REPLY_SERVICE_API_URL"       = "https://dev-appealsreplyserviceapi.azurewebsites.net"
    "APPEALS_SERVICE_API_TIMEOUT"        = "10000"
    "APPEALS_SERVICE_API_URL"            = "https://dev-appealsserviceapi.azurewebsites.net"
    "DOCKER_REGISTRY_SERVER_PASSWORD"    = "a2oJipgw82NsbjA=9JhYuGy5pI9s6pSY"
    "DOCKER_REGISTRY_SERVER_URL"         = "https://pinscommonukscontainers3887default.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"    = "pinscommonukscontainers3887default"
    "DOCUMENTS_SERVICE_API_TIMEOUT"      = "10000"
    "DOCUMENTS_SERVICE_API_URL"          = "https://dev-documentserviceapi.azurewebsites.net"
    "FILE_UPLOAD_DEBUG"                  = "false"
    "FILE_UPLOAD_MAX_FILE_SIZE_BYTES"    = "15000000"
    "FILE_UPLOAD_TMP_PATH"               = "/tmp"
    "FILE_UPLOAD_USE_TEMP_FILES"         = "true"
    "HOST_URL"                           = "https://dev-lpaquestionnaireserviceapi.azurewebsites.net"
    "LOGGER_LEVEL"                       = "info"
    "NODE_ENV"                           = "production"
    "PDF_SERVICE_API_URL"                = "https://dev-pdfserviceapi.azurewebsites.net/api/v1"
    "PORT"                               = "3000"
    "SESSION_KEY"                        = "some_secure_key_goes_here"
    "SESSION_MONGODB_COLLECTION"         = "sessions"
    "SESSION_MONGODB_DB_NAME"            = "lpa-questionnaire-web-app"
    "SESSION_MONGODB_URL"                = "mongodb://pins-uks-mongodb-9475-dev:u5K6MuXfg1SjUF2iorpYua1j8xFcvl2x566WF9aMzNZpDYw52HGrZd9djdOLGfEui7WZrnJ1l9En5n1NwgAKjA==@pins-uks-mongodb-9475-dev.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@pins-uks-mongodb-9475-dev@"
    "USE_SECURE_SESSION_COOKIES"         = "false"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = "28"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE  = "false"
  }
}

# resource "azurerm_dns_zone" "dns_zone1" {
#   name                = "https://lpa-questions-dev.planninginspectorate.gov.uk"
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "azurerm_dns_a_record" "example" {
#   name                = "dns_a_record"
#   zone_name           = azurerm_dns_zone.dns_zone1.name
#   resource_group_name = azurerm_resource_group.rg.name
#   ttl                 = 300
#   //records             = ["10.0.180.17"]
# }

resource "azurerm_app_service_virtual_network_swift_connection" "connect3" {
  app_service_id = azurerm_app_service.app_service3.id
  subnet_id      = azurerm_subnet.subnet.id
}
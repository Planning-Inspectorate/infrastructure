resource "azurerm_app_service" "lpa_questionnaire" {
  name                = "${local.resource_name_prefix}-${var.lpa_questionnaire}"
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
    "APPINSIGHTS_INSTRUMENTATIONKEY"           = azurerm_application_insights.appinsights.instrumentation_key
    "ALLOW_APPEAL_REPLY_CREATE"                = "true"
    "APPEAL_REPLY_SERVICE_API_TIMEOUT"         = "10000"
    "APPEAL_REPLY_SERVICE_API_URL"             = "https://${local.resource_name_prefix}-${var.appeal_reply_service_api}.azurewebsites.net"
    "APPEALS_SERVICE_API_TIMEOUT"              = "10000"
    "APPEALS_SERVICE_API_URL"                  = "https://${local.resource_name_prefix}-${var.appeals_service_api}.azurewebsites.net"
    "CLAM_AV_HOST"                             = "dev-clamav.azurewebsites.net"
    "DOCKER_CUSTOM_IMAGE_NAME"                 = "pinscommonukscontainers3887default.azurecr.io/lpa-questionnaire-web-app"
    "DOCKER_REGISTRY_SERVER_PASSWORD"          = data.azurerm_key_vault_secret.docker-reg-server-pwd.value
    "DOCKER_REGISTRY_SERVER_URL"               = data.azurerm_key_vault_secret.docker-reg-server-url.value
    "DOCKER_REGISTRY_SERVER_USERNAME"          = data.azurerm_key_vault_secret.docker-reg-server-usr.value
    "DOCUMENTS_SERVICE_API_TIMEOUT"            = "10000"
    "DOCUMENTS_SERVICE_API_URL"                = azurerm_app_service.appeals_document_service_api.default_site_hostname
    "FILE_UPLOAD_DEBUG"                        = "false"
    "FILE_UPLOAD_MAX_FILE_SIZE_BYTES"          = "15000000"
    "FILE_UPLOAD_TMP_PATH"                     = "/tmp"
    "FILE_UPLOAD_USE_TEMP_FILES"               = "true"
    "HOST_URL"                                 = "https://${local.resource_name_prefix}-${var.lpa_questionnaire}.azurewebsites.net"
    "JWT_SIGNING_KEY"                          = "QeThWmZq4t7w!z$C&F)J@NcRfUjXn2r5"
    "LOGGER_LEVEL"                             = "debug"
    "MICROSOFT_PROVIDER_AUTHENTICATION_SECRET" = data.azurerm_key_vault_secret.microsoft-pro-auth-lpa-secret.value
    "NODE_ENV"                                 = "production"
    "PDF_SERVICE_API_URL"                      = azurerm_app_service.pdf_service_api.default_site_hostname
    "PORT"                                     = "3000"
    "SESSION_KEY"                              = "some_secure_key_goes_here"
    "SESSION_MONGODB_COLLECTION"               = "sessions"
    "SESSION_MONGODB_DB_NAME"                  = "lpa-questionnaire-web-app"
    "SESSION_MONGODB_URL"                      = "mongodb://pins-uks-mongodb-9475-dev:MjTJyWvTBUhVjSztbpx3eySEB7VCGekVPAzdqdWaAuxqwQApkRi1WYldeMFaDTYaQlYuauB31pwrWVBd5d1YDA==@pins-uks-mongodb-9475-dev.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@pins-uks-mongodb-9475-dev@"
    "USE_SECURE_SESSION_COOKIES"               = "false"
    "TOKEN_COOKIE_NAME"                        = "authCookie"
    "TOKEN_VALIDITY_MILLIS"                    = "144400000"
    "USE_SECURE_SESSION_COOKIES"               = "false"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"       = "28"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE        = "false"
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
  app_service_id = azurerm_app_service.lpa_questionnaire.id
  subnet_id      = azurerm_subnet.subnet.id
}

# resource "azurerm_private_endpoint" "privateendpoint4" {
#   name                = "lpaquestionnaireendpoint"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   subnet_id           = azurerm_subnet.subnet.id

#   private_service_connection {
#     name = "lpaconnection"
#     private_connection_resource_id = azurerm_app_service.lpa_questionnaire.id
#     subresource_names = ["sites"]
#     is_manual_connection = false
#   }
# }

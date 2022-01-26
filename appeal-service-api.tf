resource "azurerm_app_service" "appeals_service_api" {
  name                = "${local.resource_name_prefix}-${var.appeals_service_api}"
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
    "APPINSIGHTS_INSTRUMENTATIONKEY"                                              = azurerm_application_insights.appinsights.instrumentation_key
    "APP_APPEALS_BASE_URL"                                                        = "https://${local.resource_name_prefix}-${var.forms_webappservice_api}.azurewebsites.net"
    "APP_LPA_QUESTIONNAIRE_BASE_URL"                                              = "https://${azurerm_app_service.lpa_questionnaire.default_site_hostname}"
    "APPEALS_SERVICE_API_URL"                                                     = "https://${local.resource_name_prefix}-${var.appeals_service_api}.azurewebsites.net"
    "DOCKER_ENABLE_CI"                                                            = "true"
    "DOCKER_REGISTRY_SERVER_PASSWORD"                                             = data.azurerm_key_vault_secret.docker-reg-server-pwd.value
    "DOCKER_REGISTRY_SERVER_URL"                                                  = data.azurerm_key_vault_secret.docker-reg-server-url.value
    "DOCKER_REGISTRY_SERVER_USERNAME"                                             = data.azurerm_key_vault_secret.docker-reg-server-usr.value
    "DOCS_API_PATH"                                                               = "/opt/app/api"
    "DOCUMENTS_SERVICE_API_TIMEOUT"                                               = "10000"
    "DOCUMENTS_SERVICE_API_URL"                                                   = "https://${azurerm_app_service.appeals_document_service_api.default_site_hostname}"
    "HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION"                                  = "true"
    "HORIZON_HAS_PUBLISHER_HOST"                                                  = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "HORIZON_HAS_PUBLISHER_HOSTNAME"                                              = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "HORIZON_HAS_PUBLISHER_PASSWORD"                                              = data.azurerm_servicebus_namespace_authorization_rule.sharedaccesspolicy3.primary_key
    "HORIZON_HAS_PUBLISHER_PORT"                                                  = "5671"
    "HORIZON_HAS_PUBLISHER_QUEUE"                                                 = "horizon-householder-appeal-publish"
    "HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT"                                       = "5"
    "HORIZON_HAS_PUBLISHER_TRANSPORT"                                             = "tls"
    "HORIZON_HAS_PUBLISHER_USERNAME"                                            = data.azurerm_servicebus_namespace_authorization_rule.sharedaccesspolicy3.name
    "LOGGER_LEVEL"                                                                = "info"
    "LPA_DATA_PATH"                                                               = "/opt/app/data/lpa-list.csv"
    "LPA_TRIALIST_DATA_PATH"                                                      = "/opt/app/data/lpa-trialists.json"
    "MONGODB_AUTO_INDEX"                                                          = "true"
    "MONGODB_DB_NAME"                                                             = data.azurerm_key_vault_secret.mongodb-appeals-service.value
    "MONGODB_URL"                                                                 = data.azurerm_key_vault_secret.mongodb-connection-url.value
    "NODE_ENV"                                                                    = "production"
    "SERVER_PORT"                                                                 = "3000"
    "SERVER_SHOW_ERRORS"                                                          = "true"
    "SERVER_TERMINATION_GRACE_PERIOD_SECONDS"                                     = "0"
    "SQL_HASAPPEALS_PUBLISHER_ATTEMPT_RECONNECTION"                               = "true"
    "SQL_HASAPPEALS_PUBLISHER_HOST"                                               = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "SQL_HASAPPEALS_PUBLISHER_HOSTNAME"                                           = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "SQL_HASAPPEALS_PUBLISHER_PASSWORD"                                           = data.azurerm_servicebus_namespace_authorization_rule.sharedaccesspolicy3.primary_key
    "SQL_HASAPPEALS_PUBLISHER_PORT"                                               = "5671"
    "SQL_HASAPPEALS_PUBLISHER_QUEUE"                                              = "sql-householder-appeal-publish"
    "SQL_HASAPPEALS_PUBLISHER_RECONNECT_LIMIT"                                    = "5"
    "SQL_HASAPPEALS_PUBLISHER_TRANSPORT"                                          = "tls"
    "SQL_HASAPPEALS_PUBLISHER_USERNAME"                                           = data.azurerm_servicebus_namespace_authorization_rule.sharedaccesspolicy3.name
    "SRV_HORIZON_URL"                                                             = ""
    "SRV_NOTIFY_API_KEY"                                                          = "hasserviceapikey-c46d894e-d10e-4c46-a467-019576cd906a-7105b035-9f5b-4207-bce5-a3cbdf10f0da"
    "SRV_NOTIFY_APPEAL_SUBMISSION_CONFIRMATION_EMAIL_TO_APPELLANT_TEMPLATE_ID"    = "72f71441-12bf-4455-afbc-c58f9c72bfbd"
    "SRV_NOTIFY_APPEAL_SUBMISSION_RECEIVED_NOTIFICATION_EMAIL_TO_LPA_TEMPLATE_ID" = "79488d5d-7efd-4273-a11f-e73f11d19676"
    "SRV_NOTIFY_BASE_URL"                                                         = "https://api.notifications.service.gov.uk"
    "SRV_NOTIFY_EMAIL_REPLYTO_ID_START_EMAIL_TO_LPA"                              = "f1e6c8c5-786e-41ca-9086-10b67f31bc86"
    "SRV_NOTIFY_SERVICE_ID"                                                       = "c46d894e-d10e-4c46-a467-019576cd906a"
    "SRV_NOTIFY_START_EMAIL_TO_LPA_TEMPLATE_ID"                                   = "c4701212-4b6a-4b55-801a-c86c7dbea54b"
    "SRV_NOTIFY_TEMPLATE_ID"                                                      = "15ed37a9-506c-4845-88ea-95502282a863"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"                                          = "28"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"                                         = "false"
  }
  tags = local.common_tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "connect2" {
  app_service_id = azurerm_app_service.appeals_service_api.id
  subnet_id      = azurerm_subnet.subnet.id
}

# resource "azurerm_private_endpoint" "privateendpoint3" {
#   name                = "appealserviceendpoint"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   subnet_id           = azurerm_subnet.subnet.id

#   private_service_connection {
#     name = "arconnection"
#     private_connection_resource_id = azurerm_app_service.app_service2.id
#     subresource_names = ["sites"]
#     is_manual_connection = false
#   }
# }

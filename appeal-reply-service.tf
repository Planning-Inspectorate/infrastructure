resource "azurerm_app_service" "app_service5" {
  name                = "${local.resource_name_prefix}-${var.app_service_name5}"
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
    "APPINSIGHTS_INSTRUMENTATIONKEY"                                   = azurerm_application_insights.appinsights.instrumentation_key
    # "APPEALS_SERVICE_API_URL"                                          = azurerm_app_service.app_service2.default_site_hostname
    "DOCKER_REGISTRY_SERVER_PASSWORD"                                  = data.azurerm_key_vault_secret.docker-reg-server-pwd.value
    "DOCKER_REGISTRY_SERVER_URL"                                       = data.azurerm_key_vault_secret.docker-reg-server-url.value
    "DOCKER_REGISTRY_SERVER_USERNAME"                                  = data.azurerm_key_vault_secret.docker-reg-server-usr.value
    "DOCS_API_PATH"                                                    = "/opt/app/api"
    "DOCUMENTS_SERVICE_API_URL"                                        = azurerm_app_service.app_service.default_site_hostname
    "HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION"                       = "true"
    "HORIZON_HAS_PUBLISHER_HOST"                                       = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "HORIZON_HAS_PUBLISHER_HOSTNAME"                                   = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "HORIZON_HAS_PUBLISHER_PASSWORD"                                   = azurerm_servicebus_namespace_authorization_rule.sharedaccesspolicy1.primary_key
    "HORIZON_HAS_PUBLISHER_PORT"                                       = "5671"
    "HORIZON_HAS_PUBLISHER_QUEUE"                                      = "horizon-householder-appeal-publish"
    "HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT"                            = "1"
    "HORIZON_HAS_PUBLISHER_TRANSPORT"                                  = "tls"
    "HORIZON_HAS_PUBLISHER_USERNAME"                                   = data.azurerm_key_vault_secret.horizon-pub-usr.value
    "LOGGER_LEVEL"                                                     = "info"
    "MONGODB_DB_NAME"                                                  = data.azurerm_key_vault_secret.mongodb-appeals-reply.value
    "MONGODB_URL"                                                      = data.azurerm_key_vault_secret.mongodb-connection-url.value
    "NODE_ENV"                                                         = "production"
    "SERVER_PORT"                                                      = "3000"
    "SERVER_SHOW_ERRORS"                                               = "true"
    "SERVER_TERMINATION_GRACE_PERIOD_SECONDS"                          = "0"
    "SQL_LPA_PUBLISHER_ATTEMPT_RECONNECTION"                           = "true"
    "SQL_LPA_PUBLISHER_HOST"                                           = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "SQL_LPA_PUBLISHER_HOSTNAME"                                       = "${azurerm_servicebus_namespace.service_bus.name}.servicebus.windows.net"
    "SQL_LPA_PUBLISHER_PASSWORD"                                       = data.azurerm_key_vault_secret.sql-lpa-pub-pwd.value
    "SQL_LPA_PUBLISHER_PORT"                                           = "5671"
    "SQL_LPA_PUBLISHER_QUEUE"                                          = "sql-householder-lpa-publish"
    "SQL_LPA_PUBLISHER_RECONNECT_LIMIT"                                = "5"
    "SQL_LPA_PUBLISHER_TRANSPORT"                                      = "tls"
    "SQL_LPA_PUBLISHER_USERNAME"                                       = data.azurerm_key_vault_secret.sql-lpa-pub-usr.value
    "SRV_NOTIFY_BASE_URL"                                              = "https://api.notifications.service.gov.uk"
    "SRV_NOTIFY_EMAIL_REPLYTO_ID_APPEAL_REPLY_SUBMISSION_CONFIRMATION" = "f1e6c8c5-786e-41ca-9086-10b67f31bc86"
    "SRV_NOTIFY_SERVICE_ID"                                            = "c46d894e-d10e-4c46-a467-019576cd906a"
    "SRV_NOTIFY_TEMPLATE_ID_APPEAL_REPLY_SUBMISSION_CONFIRMATION"      = "937b4147-8420-42da-859d-d4a65bdf99bc"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"                               = "28"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"                              = "false"
  }
  tags = local.common_tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "connect5" {
  app_service_id = azurerm_app_service.app_service5.id
  subnet_id      = azurerm_subnet.subnet.id
}

# resource "azurerm_private_endpoint" "privateendpoint2" {
#   name                = "appealreplyserviceendpoint"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   subnet_id           = azurerm_subnet.subnet.id

#   private_service_connection {
#     name = "arsconnection"
#     private_connection_resource_id = azurerm_app_service.app_service5.id
#     subresource_names = ["sites"]
#     is_manual_connection = false
#   }
# }

resource "azurerm_app_service" "app_service2" {
  name                = "${local.resource_name_prefix}-${var.app_service_name2}"
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
    "APP_APPEALS_BASE_URL"                                                        = "https://pins-dev-formswebappserviceapi.azurewebsites.net"
    "APP_LPA_QUESTIONNAIRE_BASE_URL"                                              = "https://pins-dev-lpa-questionnaire-test7.azurewebsites.net"
    "APPEALS_SERVICE_API_URL"                                                     = "https://pins-dev-appeals-service-api-test7.azurewebsites.net"
    "DOCKER_ENABLE_CI"                                                            = "true"
    "DOCKER_REGISTRY_SERVER_PASSWORD"                                             = "a2oJipgw82NsbjA=9JhYuGy5pI9s6pSY"
    "DOCKER_REGISTRY_SERVER_URL"                                                  = "https://pinscommonukscontainers3887default.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"                                             = "pinscommonukscontainers3887default"
    "DOCS_API_PATH"                                                               = "/opt/app/api"
    "DOCUMENTS_SERVICE_API_TIMEOUT"                                               = "10000"
    "DOCUMENTS_SERVICE_API_URL"                                                   = "https://pins-dev-appeals-document-service-api-test7.azurewebsites.net"
    "HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION"                                  = "true"
    "HORIZON_HAS_PUBLISHER_HOST"                                                  = "pins-uks-message-queue-dev.servicebus.windows.net"
    "HORIZON_HAS_PUBLISHER_HOSTNAME"                                              = "pins-uks-message-queue-dev.servicebus.windows.net"
    "HORIZON_HAS_PUBLISHER_PASSWORD"                                              = "5RnT8GSCIGIQHXVbbTfNQWxmKXVYzOOVUgFhaqy31tw="
    "HORIZON_HAS_PUBLISHER_PORT"                                                  = "5671"
    "HORIZON_HAS_PUBLISHER_QUEUE"                                                 = "horizon-householder-appeal-publish"
    "HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT"                                       = "5"
    "HORIZON_HAS_PUBLISHER_TRANSPORT"                                             = "tls"
    HORIZON_HAS_PUBLISHER_USERNAME                                                = "RootManageSharedAccessKey"
    "LOGGER_LEVEL"                                                                = "info"
    "LPA_DATA_PATH"                                                               = "/opt/app/data/lpa-list.csv"
    "LPA_TRIALIST_DATA_PATH"                                                      = "/opt/app/data/lpa-trialists.json"
    "MONGODB_AUTO_INDEX"                                                          = "true"
    "MONGODB_DB_NAME"                                                             = "appeals-service-api"
    "MONGODB_URL"                                                                 = "mongodb://pins-uks-mongodb-9475-dev:MjTJyWvTBUhVjSztbpx3eySEB7VCGekVPAzdqdWaAuxqwQApkRi1WYldeMFaDTYaQlYuauB31pwrWVBd5d1YDA==@pins-uks-mongodb-9475-dev.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@pins-uks-mongodb-9475-dev@"
    "NODE_ENV"                                                                    = "production"
    "SERVER_PORT"                                                                 = "3000"
    "SERVER_SHOW_ERRORS"                                                          = "true"
    "SERVER_TERMINATION_GRACE_PERIOD_SECONDS"                                     = "0"
    "SQL_HASAPPEALS_PUBLISHER_ATTEMPT_RECONNECTION"                               = "pins-uks-message-queue-dev.servicebus.windows.net"
    "SQL_HASAPPEALS_PUBLISHER_HOSTNAME"                                           = "pins-uks-message-queue-dev.servicebus.windows.net"
    "SQL_HASAPPEALS_PUBLISHER_PASSWORD"                                           = "5RnT8GSCIGIQHXVbbTfNQWxmKXVYzOOVUgFhaqy31tw="
    "SQL_HASAPPEALS_PUBLISHER_PORT"                                               = "5671"
    "SQL_HASAPPEALS_PUBLISHER_QUEUE"                                              = "sql-householder-appeal-publish"
    "SQL_HASAPPEALS_PUBLISHER_RECONNECT_LIMIT"                                    = "5"
    "SQL_HASAPPEALS_PUBLISHER_TRANSPORT"                                          = "tls"
    "SQL_HASAPPEALS_PUBLISHER_USERNAME"                                           = "RootManageSharedAccessKey"
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
  app_service_id = azurerm_app_service.app_service2.id
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

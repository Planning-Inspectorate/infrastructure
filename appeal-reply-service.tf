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
    "APPEALS_SERVICE_API_URL"                                          = "https://dev-appealsserviceapi.azurewebsites.net/api/v1"
    "DOCKER_REGISTRY_SERVER_PASSWORD"                                  = "a2oJipgw82NsbjA=9JhYuGy5pI9s6pSY"
    "DOCKER_REGISTRY_SERVER_URL"                                       = "https://pinscommonukscontainers3887default.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"                                  = "pinscommonukscontainers3887default"
    "DOCS_API_PATH"                                                    = "/opt/app/api"
    "DOCUMENTS_SERVICE_API_URL"                                        = "https://documentserviceapi.azurewebsites.net/api/v1"
    "HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION"                       = "true"
    "HORIZON_HAS_PUBLISHER_HOST"                                       = "rabbitmq"
    "HORIZON_HAS_PUBLISHER_HOSTNAME"                                   = ""
    "HORIZON_HAS_PUBLISHER_PASSWORD"                                   = "admin"
    "HORIZON_HAS_PUBLISHER_PORT"                                       = "5672"
    "HORIZON_HAS_PUBLISHER_QUEUE"                                      = ""
    "HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT"                            = "1"
    "HORIZON_HAS_PUBLISHER_TRANSPORT"                                  = ""
    "HORIZON_HAS_PUBLISHER_USERNAME"                                   = "admin"
    "LOGGER_LEVEL"                                                     = "info"
    "MONGODB_DB_NAME"                                                  = "mongodb://pins-uks-mongodb-9475-dev:u5K6MuXfg1SjUF2iorpYua1j8xFcvl2x566WF9aMzNZpDYw52HGrZd9djdOLGfEui7WZrnJ1l9En5n1NwgAKjA==@pins-uks-mongodb-9475-dev.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@pins-uks-mongodb-9475-dev@"
    "NODE_ENV"                                                         = "production"
    "SERVER_PORT"                                                      = "3000"
    "SERVER_SHOW_ERRORS"                                               = "true"
    "SERVER_TERMINATION_GRACE_PERIOD_SECONDS"                          = "0"
    "SRV_NOTIFY_BASE_URL"                                              = "https://api.notifications.service.gov.uk"
    "SRV_NOTIFY_EMAIL_REPLYTO_ID_APPEAL_REPLY_SUBMISSION_CONFIRMATION" = "f1e6c8c5-786e-41ca-9086-10b67f31bc86"
    "SRV_NOTIFY_SERVICE_ID"                                            = "c46d894e-d10e-4c46-a467-019576cd906a"
    "SRV_NOTIFY_TEMPLATE_ID_APPEAL_REPLY_SUBMISSION_CONFIRMATION"      = "937b4147-8420-42da-859d-d4a65bdf99bc"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"                               = "28"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"                              = "false"
  }
  tags = local.common_tags
}

# resource "azurerm_app_service_virtual_network_swift_connection" "connect5" {
#   app_service_id = azurerm_app_service.app_service5.id
#   subnet_id      = azurerm_subnet.subnet.id
# }

resource "azurerm_private_endpoint" "privateendpoint2" {
  name                = "appealreplyserviceendpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name = "arsconnection"
    private_connection_resource_id = azurerm_app_service.app_service5.id
    subresource_names = ["sites"]
    is_manual_connection = false
  }
}

resource "azurerm_function_app" "fa1" {
  name                       = var.functionapp1
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                           = azurerm_application_insights.appinsights.instrumentation_key
    "APPEALS_SERVICE_URL"                                      = "https://pins-dev-appeals-service-api-test7.azurewebsites.net"
    # "APPLICATIONINSIGHTS_CONNECTION_STRING"                    = "InstrumentationKey=70d6e1cf-c440-4460-b4c1-4f1a422c2825;IngestionEndpoint=https://uksouth-1.in.applicationinsights.azure.com/"
    # "AzureWebJobs.horizon-householder-appeal-publish.Disabled" = "0"
    # "AzureWebJobs.sql-householder-appeal-publish.Disabled"     = "0"
    # "AzureWebJobs.sql-householder-lpa-publish.Disabled"        = "0"
    "AzureWebJobsStorage"                                      = "0"
    "DOCUMENT_SERVICE_URL"                                     = "https://pins-dev-appeals-document-service-api-test7.azurewebsites.net"
    "FUNCTIONS_EXTENSION_VERSION"                              = "~3"
    "FUNCTIONS_WORKER_RUNTIME"                                 = "node"
    "HORIZON_URL"                                              = "http://10.0.7.4:8000"
    "SQLSERVER_DATABASE"                                       = "backoffice-d-uks-sqldb"
    "SQLSERVER_NAME"                                           = "pins-d-uks-sql.database.windows.net"
    "SQLSERVER_PASSWORD"                                       = "M4#*xsEM"
    "SQLSERVER_PORT"                                           = "1433"
    "SQLSERVER_USERNAME"                                       = "backofficeadmin"
    "WEBSITE_CONTENTAZUREFILECONNECTIONSTRING"                 = "DefaultEndpointsProtocol=https;AccountName=appealsstoragevcirfs;AccountKey=C5J7BtaIaqyyAlvmOxr0PwWMWPkOVvOXofpGdeqwMaRf1xrm+U/14xddJapMm3o/yIDFpAhDXp7ldULkOP3F/w==;EndpointSuffix=core.windows.net"
    "WEBSITE_CONTENTSHARE"                                     = azurerm_storage_share.fileshare.name
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"                          = "true"
    "WEBSITE_NODE_DEFAULT_VERSION"                             = "~14"
    "WEBSITE_RUN_FROM_PACKAGE"                                 = "1"
  }
  os_type = "linux"
  site_config {
    linux_fx_version          = "node|14"
    use_32_bit_worker_process = false
  }
}


# resource "azurerm_function_app" "fa2" {
#   name                       = var.functionapp2
#   location                   = azurerm_resource_group.rg.location
#   resource_group_name        = azurerm_resource_group.rg.name
#   app_service_plan_id        = azurerm_app_service_plan.asp.id
#   storage_account_name       = azurerm_storage_account.sa.name
#   storage_account_access_key = azurerm_storage_account.sa.primary_access_key
#   app_settings = {
#     "APPINSIGHTS_INSTRUMENTATIONKEY"     = azurerm_application_insights.appinsights.instrumentation_key
#   }
# }

# resource "azurerm_function_app" "fa3" {
#   name                       = var.functionapp3
#   location                   = azurerm_resource_group.rg.location
#   resource_group_name        = azurerm_resource_group.rg.name
#   app_service_plan_id        = azurerm_app_service_plan.asp.id
#   storage_account_name       = azurerm_storage_account.sa.name
#   storage_account_access_key = azurerm_storage_account.sa.primary_access_key
#   app_settings = {
#     "APPINSIGHTS_INSTRUMENTATIONKEY"     = azurerm_application_insights.appinsights.instrumentation_key
#   }
# }

resource "azurerm_app_service_virtual_network_swift_connection" "connect4" {
  app_service_id = azurerm_function_app.fa1.id
  subnet_id      = azurerm_subnet.subnet.id
}

# resource "azurerm_app_service_virtual_network_swift_connection" "connect6" {
#   app_service_id = azurerm_function_app.fa2.id
#   subnet_id      = azurerm_subnet.subnet.id
# }

# resource "azurerm_app_service_virtual_network_swift_connection" "connect7" {
#   app_service_id = azurerm_function_app.fa3.id
#   subnet_id      = azurerm_subnet.subnet.id
# }

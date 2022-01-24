resource "azurerm_log_analytics_workspace" "app-workspace" {
  name                = "appserviceworkspace"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_storage_account" "appstorage" {
  name                     = "pins-app-webstorage"
  resource_group_name      = azurerm_resource_group.AppSrvRG.name
  location                 = azurerm_resource_group.AppSrvRG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_log_analytics_storage_insights" "appstorageinsight" {
  name                = "pins-app-webinsight"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  workspace_id        = azurerm_log_analytics_workspace.app-workspace.id

  storage_account_id  = azurerm_storage_account.appstorage.id
  storage_account_key = azurerm_storage_account.appstorage.primary_access_key
}

resource "azurerm_log_analytics_solution" "app-log-solutions" {
  solution_name         = "ContainerInsights"
  location              = azurerm_resource_group.AppSrvRG.location
  resource_group_name   = azurerm_resource_group.AppSrvRG.name
  workspace_resource_id = azurerm_log_analytics_workspace.app-workspace.id
  workspace_name        = azurerm_log_analytics_workspace.app-workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}


resource "azurerm_log_analytics_linked_storage_account" "appstorage-link" {
  data_source_type      = "customlogs"
  resource_group_name   = azurerm_resource_group.AppSrvRG.name
  workspace_resource_id = azurerm_log_analytics_workspace.app-workspace.id
  storage_account_ids   = [azurerm_storage_account.appstorage.id]
}

resource "azurerm_log_analytics_saved_search" "app-savesearcb" {
  name                       = "App-SavedSearch"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.app-workspace.id

  category     = "exampleCategory"
  display_name = "exampleDisplayName"
  query        = "exampleQuery"
}
resource "azurerm_function_app" "fa1" {
  name                       = var.functionapp1
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
}


resource "azurerm_function_app" "fa2" {
  name                       = var.functionapp2
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
}

resource "azurerm_function_app" "fa3" {
  name                       = var.functionapp3
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
}

resource "azurerm_app_service_virtual_network_swift_connection" "connect4" {
  app_service_id = azurerm_function_app.fa1.id
  subnet_id      = azurerm_subnet.subnet.id
}

resource "azurerm_app_service_virtual_network_swift_connection" "connect6" {
  app_service_id = azurerm_function_app.fa2.id
  subnet_id      = azurerm_subnet.subnet.id
}

resource "azurerm_app_service_virtual_network_swift_connection" "connect7" {
  app_service_id = azurerm_function_app.fa3.id
  subnet_id      = azurerm_subnet.subnet.id
}
resource "azurerm_servicebus_namespace" "service_bus" {
  name                = var.Service_bus_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "queue1" {
  name                = "add-document"
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name      = azurerm_servicebus_namespace.service_bus.name

  enable_partitioning = true
}

resource "azurerm_servicebus_queue" "queue2" {
  name                = "create-contact"
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name      = azurerm_servicebus_namespace.service_bus.name

  enable_partitioning = true
}

resource "azurerm_servicebus_queue" "queue3" {
  name                = "horizon-householder-appeal-publish"
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name      = azurerm_servicebus_namespace.service_bus.name

  enable_partitioning = true
}

resource "azurerm_role_assignment" "role_assignment3" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_app_service.app_service5.identity[0].principal_id
}

# resource "azurerm_servicebus_namespace_network_rule_set" "networkintegration1" {
#   namespace_name      = azurerm_servicebus_namespace.service_bus.name
#   resource_group_name = azurerm_resource_group.rg.name

#   default_action = "Allow"

#   network_rules {
#     subnet_id                            = azurerm_subnet.subnet.id
#     ignore_missing_vnet_service_endpoint = false
#   }
# }

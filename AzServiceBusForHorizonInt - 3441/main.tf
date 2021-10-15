resource "azurerm_servicebus_namespace" "sbns" {
  name                = var.servicebus_namepspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.servicebus_namepspace_sku
}
resource "azurerm_servicebus_queue" "add-document" {
  name                = "add-document"
  resource_group_name = var.rg_name
  namespace_name      = azurerm_servicebus_namespace.sbns.name
  dead_lettering_on_message_expiration = false
  default_message_ttl = "P14D"
  max_size_in_megabytes = 1024
  lock_duration = "PT30S"
}

resource "azurerm_servicebus_queue" "create-contact" {
  name                = "create-contact"
  resource_group_name = var.rg_name
  namespace_name      = azurerm_servicebus_namespace.sbns.name
  dead_lettering_on_message_expiration = true
  default_message_ttl = "P14D"
  max_size_in_megabytes = 1024
  lock_duration = "PT30S"

}
resource "azurerm_servicebus_queue" "horizon-householder-appeal-publish" {
  name                = "horizon-householder-appeal-publish"
  resource_group_name = var.rg_name
  namespace_name      = azurerm_servicebus_namespace.sbns.name
  dead_lettering_on_message_expiration = false
  default_message_ttl = "P14D"
  max_size_in_megabytes = 5120
  lock_duration = "PT1M"
}
resource "azurerm_servicebus_queue" "trigger-poc" {
  name                = "trigger-poc"
  resource_group_name = var.rg_name
  namespace_name      = azurerm_servicebus_namespace.sbns.name
  dead_lettering_on_message_expiration = false
  default_message_ttl = "P14D"
  max_size_in_megabytes = 1024
  lock_duration = "PT30S"
}

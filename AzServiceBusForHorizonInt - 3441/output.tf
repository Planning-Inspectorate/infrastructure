output "appeal_service" {
  value     = azurerm_servicebus_namespace.sbns.*
  sensitive = true
}
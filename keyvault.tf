data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = "pins-uks-vault-dev"
}

resource "azurerm_key_vault_access_policy" "myapp" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_app_service.app_service.identity[0].principal_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]

}
resource "azurerm_key_vault_access_policy" "myapp2" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_app_service.app_service2.identity[0].principal_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]

}
resource "azurerm_key_vault_access_policy" "myapp3" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_app_service.app_service3.identity[0].principal_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]

}
resource "azurerm_key_vault_access_policy" "myapp5" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_app_service.app_service5.identity[0].principal_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]

}

# data "azurerm_key_vault_secret" "dockerregistryurl" {
#   name = "DOCKERREGISTRYSERVURsdf"
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }

data "azurerm_key_vault_secret" "example" {
  name         = "mongodb-connection-url"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

output "secret_value" {
  value = data.azurerm_key_vault_secret.example.value
}
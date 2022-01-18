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

data "azurerm_key_vault_secret" "docker-reg-server-url" {
  name         = "docker-reg-server-url"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "mongodb-connection-url" {
  name         = "mongodb-connection-url"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "sqlpassword" {
  name         = "sql-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "mongodb-name" {
  name         = "mongodb-name"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "docker-reg-server-pwd" {
  name         = "docker-reg-server-pwd"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "docker-reg-server-usr" {
  name         = "docker-reg-server-usr"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "sql-lpa-pub-usr" {
  name         = "sql-lpa-pub-usr"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "sql-lpa-pub-pwd" {
  name         = "sql-lpa-pub-pwd"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "horizon-pub-usr" {
  name         = "horizon-pub-usr"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "horizon-pub-pwd" {
  name         = "horizon-pub-pwd"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "sql-server-usr" {
  name         = "sql-server-usr"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "sql-appeals-pub-usr" {
  name         = "sql-appeals-pub-user"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "sql-appeals-pub-pwd" {
  name         = "sql-appeals-pub-pwd"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "microsoft-pro-auth-secret" {
  name          = "microsoft-pro-auth-secret"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

# output "secret_value" {
#   value = data.azurerm_key_vault_secret.example.value
#   sensitive = true
# }

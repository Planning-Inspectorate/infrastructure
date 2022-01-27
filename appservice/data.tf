data "azurerm_resource_group" "KVRG" {
 name = var.KeyVaultRG
}

data "azurerm_key_vault" "KVault" {
 name                = var.KeyVaultName
 resource_group_name = data.azurerm_resource_group.KVRG.name
}

data "azurerm_key_vault_secret" "site-pip" {
 name         = "sitepipKey"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "VpnConnectionKey" {
 name         = "vpnconnectionkey"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "DockerUserName" {
 name         = "dockerusername"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "DockerUserPass" {
 name         = "dockeruserpass"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "DockerSessionKey" {
 name         = "dockersessionkey"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "EncryptionSecretKey" {
 name         = "encryptionsecretkey"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "MysqlPassword" {
 name         = "mysqlpassword"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "MysqlUserName" {
 name         = "mysqlusername"
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "SrvNotifyKey" {
 name         = "sevnotifyapikey"
 key_vault_id = data.azurerm_key_vault.KVault.id
}
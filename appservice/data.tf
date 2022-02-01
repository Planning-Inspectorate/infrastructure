data "azurerm_resource_group" "KVRG" {
 name = var.KeyVaultRG
}

data "azurerm_key_vault" "KVault" {
 name                = var.KeyVaultName
 resource_group_name = data.azurerm_resource_group.KVRG.name
}

data "azurerm_key_vault_secret" "site-pip" {
 name         = var.sitepipKey
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "VpnConnectionKey" {
 name         = var.vpnconnectionkey
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "DockerUserName" {
 name         = var.dockerusername
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "DockerUserPass" {
 name         = var.dockeruserpass
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "DockerSessionKey" {
 name         = var.dockersessionkey
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "EncryptionSecretKey" {
 name         = var.encryptionsecretkey
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "MysqlPassword" {
 name         = var.mysqlpassword
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "MysqlUserName" {
 name         = var.mysqlusername
 key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "SrvNotifyKey" {
 name         = var.sevnotifyapikey
 key_vault_id = data.azurerm_key_vault.KVault.id
}
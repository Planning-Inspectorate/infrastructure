data "azurerm_resource_group" "KVRG" {
  name = var.KeyVaultRG
}

data "azurerm_key_vault" "KVault" {
  name                = var.KeyVaultName
  resource_group_name = data.azurerm_resource_group.KVRG.name
}

#data "azurerm_key_vault_secret" "site-pip" {
#  name         = var.SitePip
#  key_vault_id = data.azurerm_key_vault.KVault.id
#}

#data "azurerm_key_vault_secret" "vpn-ipsec" {
#  name         = var.VpnIpsec
#  key_vault_id = data.azurerm_key_vault.KVault.id
#}

data "azurerm_key_vault_secret" "DockerUserName" {
  name         = "dockerssername"
  key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "DockerUserPass" {
  name         = "dockeruserpass"
  key_vault_id = data.azurerm_key_vault.KVault.id
}
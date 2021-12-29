data "azurerm_key_vault" "KVault" {
  name                = var.KeyVaultName
  resource_group_name = var.KeyVaultRG
}

data "azurerm_key_vault_secret" "site-pip" {
  name         = var.SitePip
  key_vault_id = data.azurerm_key_vault.KVault.id
}

data "azurerm_key_vault_secret" "vpn-ipsec" {
  name         = var.VpnIpsec
  key_vault_id = data.azurerm_key_vault.KVault.id
}
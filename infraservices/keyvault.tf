resource "azurerm_resource_group" "infraservices" {
  name     = var.ResourceGroup
  location = var.Location
}


# resource "azurerm_key_vault" "KVault" {
#   name                = var.KeyVaultName
#   location            = azurerm_resource_group.vaultRG.location
#   resource_group_name = azurerm_resource_group.vaultRG.name
#   tenant_id           = data.azurerm_client_config.current.tenant_id
#   sku_name            = var.kv-sku-name

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "get", "backup", "delete", "list", "purge", "recover", "restore", "update", "WrapKey", "UnwrapKey", "Create", "Encrypt", "sign", "Decrypt", "import", "verify"
#     ]

#     secret_permissions = [
#       "get", "backup", "delete", "list", "purge", "recover", "restore", "set"
#     ]

#   }

# }



# # groups permission

# resource "azurerm_key_vault_access_policy" "KvaultAccesspol" {
#   key_vault_id = azurerm_key_vault.KVault.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = data.azuread_user.admin.object_id

#   key_permissions = [
#     "get", "backup", "delete", "list", "purge", "recover", "restore", "update", "WrapKey", "UnwrapKey", "Create", "Encrypt", "sign", "Decrypt", "import", "verify"
#   ]
#   secret_permissions = [
#     "get", "backup", "delete", "list", "purge", "recover", "restore", "set"
#   ]
# }


# # KeyVault Role Assingment to Group


# resource "azurerm_role_assignment" "kvuser-role" {
#   scope                = azurerm_key_vault.KVault.id
#   role_definition_name = var.secret_role_name
#   principal_id         = data.azuread_user.admin.object_id

#   depends_on = [azurerm_key_vault.KVault]
# }




# #  KeyVault Secrets Assingments

# resource "azurerm_key_vault_secret" "site-pip" {
#   name         = var.SitePipKey
#   value        = var.SitePipValue
#   key_vault_id = azurerm_key_vault.KVault.id
#   depends_on   = [azurerm_key_vault.KVault]
# }

# resource "azurerm_key_vault_secret" "vpn-ipsec" {
#   name         = var.VpnIpsecKey
#   value        = var.VpnIpsecValue
#   key_vault_id = azurerm_key_vault.KVault.id
#   depends_on   = [azurerm_key_vault.KVault]
# }


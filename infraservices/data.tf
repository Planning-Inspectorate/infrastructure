data "azurerm_client_config" "current" {}

data "azuread_user" "admin" {
  user_principal_name = "Rehan.Anwar@planninginspectorate.gov.uk"
}
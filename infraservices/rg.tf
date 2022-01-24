resource "azurerm_resource_group" "infraservices" {
  name     = var.ResourceGroup
  location = var.Location
}


resource "azurerm_dns_zone" "pins-pub-dns" {
  name                = "mydomain.com"
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_private_dns_zone" "pins-priv-dns" {
  name                = "mydomain.com"
  resource_group_name = azurerm_resource_group.example.name
}
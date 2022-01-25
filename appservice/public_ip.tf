resource "azurerm_public_ip" "apppip2" {
  name                = "pins-uks-applications-gw2"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  allocation_method   = "Dynamic"
}


resource "azurerm_public_ip" "apppip2" {
  name                = "pins-uks-applications-gw2"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  allocation_method   = "Dynamic"
}

resource "azurerm_local_network_gateway" "appnsip" {
  name                = "pins-uks-app-nsip"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  gateway_address     = "51.104.42.155"
  address_space       = ["10.222.0.0/26"]

  depends_on = [azurerm_public_ip.apppip2]
}
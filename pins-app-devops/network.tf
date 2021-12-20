resource "azurerm_virtual_network" "Vnet" {
  name                = var.VnetName
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  address_space       = [var.VnetAddressSpace]
}

resource "azurerm_subnet" "AppSubnets" {
  name = "web" # do not rename
  address_prefixes = [var.subnet_web]
  virtual_network_name = azurerm_virtual_network.Vnet.name
  resource_group_name  = azurerm_resource_group.AppSrvRG.name
}
resource "azurerm_subnet" "gateway-subnet" {
  name = "GatewaySubnet" # do not rename
  address_prefixes = [var.gatewaysubnet]
  virtual_network_name = azurerm_virtual_network.Vnet.name
  resource_group_name  = azurerm_resource_group.AppSrvRG.name
}
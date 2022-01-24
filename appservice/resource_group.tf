resource "azurerm_resource_group" "AppSrvRG" {
  name     = var.ResourceGroup
  location = var.Location
}




# resource "azurerm_subnet" "AppSubnets" {
#   for_each = var.AppSubnets


#   name                 = each.key
#   resource_group_name  = azurerm_resource_group.AppSrvRG.name
#   virtual_network_name = azurerm_virtual_network.Vnet.name
#   address_prefixes     = [each.value]
# }


#resource "azurerm_public_ip" "localgateway" {
#  name                = "acceptanceTestPublicIp2"
#  resource_group_name = azurerm_resource_group.AppSrvRG.name
#  location            = azurerm_resource_group.AppSrvRG.location
#  allocation_method   = "Dynamic"

#}












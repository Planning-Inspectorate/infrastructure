resource "azurerm_public_ip" "vpnip" {
  name                = "pins-uks-applications-gw"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  allocation_method   = "Dynamic"
}

resource "azurerm_local_network_gateway" "home" {
  name                = "pins-uks-apps-nsip-localnetgw"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  gateway_address     = "51.104.42.155"
  #address_space       = ["10.222.0.0/26"]

  depends_on = [azurerm_public_ip.vpnip]
}

resource "azurerm_virtual_network_gateway" "vpn-gateway" {
  name                = "vpn-gw"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"
  # private_ip_address_enabled = true

  ip_configuration {
    name                          = "vpnexternalip"
    public_ip_address_id          = azurerm_public_ip.apppip2.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway-subnet.id
  }

#  # vpn_client_configuration {
#  #   vpn_client_protocols = "IkeV2"
#  # }
  
  depends_on = [azurerm_public_ip.apppip2]
}





resource "azurerm_virtual_network_gateway_connection" "onpremise" {
  name                = "onpremise"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn-gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.home.id
  shared_key                 = "secretkey"
  
  depends_on = [azurerm_virtual_network_gateway.vpn-gateway]
}
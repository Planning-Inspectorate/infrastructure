#resource "azurerm_public_ip" "vpnip" {
#  name                = "acceptanceTestPublicIp1"
#  resource_group_name = azurerm_resource_group.AppSrvRG.name
#  location            = azurerm_resource_group.AppSrvRG.location
#  allocation_method   = "Dynamic"

#}

#resource "azurerm_virtual_network_gateway" "vpn-gateway" {
#  name                = "vpn-gw"
#  location            = azurerm_resource_group.AppSrvRG.location
#  resource_group_name = azurerm_resource_group.AppSrvRG.name
#  type                = "Vpn"
#  vpn_type            = "RouteBased"
#  sku                 = "VpnGw1"
#  # private_ip_address_enabled = true

#  ip_configuration {
#    public_ip_address_id          = azurerm_public_ip.vpnip.id
#    private_ip_address_allocation = "Dynamic"
#    subnet_id                     = azurerm_subnet.gateway-subnet.id
#  }

#  # vpn_client_configuration {
#  #   vpn_client_protocols = "IkeV2"
#  # }
#}

#resource "azurerm_local_network_gateway" "home" {
#  name                = "backHome"
#  resource_group_name = azurerm_resource_group.AppSrvRG.name
#  location            = azurerm_resource_group.AppSrvRG.location
#  gateway_address     = data.azurerm_key_vault_secret.site-pip.value
#  address_space       = ["10.222.0.0/26"]
#}



#resource "azurerm_virtual_network_gateway_connection" "onpremise" {
#  name                = "onpremise"
#  location            = azurerm_resource_group.AppSrvRG.location
#  resource_group_name = azurerm_resource_group.AppSrvRG.name

#  type                       = "IPsec"
#  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn-gateway.id
#  local_network_gateway_id   = azurerm_local_network_gateway.home.id
#  shared_key                 = data.azurerm_key_vault_secret.vpn-ipsec.value
#}
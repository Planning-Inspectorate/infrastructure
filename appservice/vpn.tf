resource "azurerm_public_ip" "vpnip1" {
  name                = "pins-uks-applications-gw1"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  allocation_method   = "Dynamic"
}

resource "azurerm_public_ip" "vpnip2" {
  name                = "pins-uks-applications-gw2"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  allocation_method   = "Dynamic"
}

resource "azurerm_local_network_gateway" "home" {
  name                = "pins-uks-apps-nsip-localnetgw"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  gateway_address     = var.gateway_address
  
  depends_on = [azurerm_public_ip.vpnip1]
}


resource "azurerm_local_network_gateway" "appnsip" {
  name                = "pins-uks-app-nsip"
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  location            = azurerm_resource_group.AppSrvRG.location
  gateway_address     = var.gateway_address
  address_space       = [var.address_space ]

  depends_on = [azurerm_public_ip.vpnip1]
}

resource "azurerm_virtual_network_gateway" "vpn-gateway" {
  name                = var.vpn_gw
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw2"
  active_active       = true

  ip_configuration {
    name                          = "vpnexternalip1"
    public_ip_address_id          = azurerm_public_ip.vpnip1.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway-subnet.id
  }

  ip_configuration {
    name                          = "vpnexternalip2"
    public_ip_address_id          = azurerm_public_ip.vpnip2.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway-subnet.id
  }  
  depends_on = [azurerm_public_ip.apppip2]
}

resource "azurerm_virtual_network_gateway_connection" "uks-applications-nsip-vpn" {
  name                = "uks-applications-nsip-vpn"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn-gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.appnsip.id
  shared_key                 = data.azurerm_key_vault_secret.VpnConnectionKey.value
  
  depends_on = [azurerm_virtual_network_gateway.vpn-gateway]
}
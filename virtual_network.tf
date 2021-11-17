data "azurerm_virtual_network" "vnet" {
  name = "pins-uks-network-dev"
  resource_group_name = "pins-uks-network-dev"
  
}


resource "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.32.15.0/24"]

  delegation {
    name = "vnet-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
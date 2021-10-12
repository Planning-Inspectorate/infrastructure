//Provider
provider "azurerm" {
  features {}
}
//Fetch Subnet
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}
//Fetch App servie Plan
data "azurerm_app_service_plan" "asp" {
  name                = var.appplan_name
  resource_group_name = var.rg_name
}
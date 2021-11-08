data "azurerm_subscription" "subscription" {}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = local.common_tags
}
resource "random_string" "rs" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

locals {
  owners               = var.business_division
  environment          = var.environment
  resource_name_prefix = "${var.business_division}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}



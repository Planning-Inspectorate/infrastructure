terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.91.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = var.TF_resource_group_name
    storage_account_name = var.TF_storage_account_name
    container_name       = var.TF_container_name
    key                  = var.TF_key
  }
}
provider "azurerm" {
  features {
  }
}
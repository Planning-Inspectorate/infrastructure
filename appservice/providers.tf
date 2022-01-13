terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      version = "~>2.75.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "pinsapplicationstfRG"
    storage_account_name = "pinsapplicationstg"
    container_name       = "pinsapplicationblob"
    key                  = "application.tfstate"
  }
}
provider "azurerm" {
  features {
  }
}
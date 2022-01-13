terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.91.0"
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
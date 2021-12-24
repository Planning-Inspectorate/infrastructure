terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      version = "~>2.75.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "pinsappealsterraforminfratest"
    storage_account_name = "pinsappealsinfrastgtest"
    container_name       = "pinsappealsinfracontainertest"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {
  }
}

provider "random" {

}

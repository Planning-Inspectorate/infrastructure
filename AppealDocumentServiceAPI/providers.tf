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
}
provider "azurerm" {
  features {
  }
}

provider "random" {

}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.88.1"
      
    }
  }
}

provider "azurerm" {
  features {}
}

# terraform {
#   backend "azurerm" {}
# }

# Aop7Q~ZjMx6vO_zutw.iXWFkDfsZcXFNA~ypr
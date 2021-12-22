
resource "azurerm_app_service_plan" "AppSrvPlan" {
  name                = var.AppSrvPlan
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  kind = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "pinsmywebapp"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  app_service_plan_id = azurerm_app_service_plan.AppSrvPlan.id

  # Do not attach Storage by default
  app_settings = {
    # WEBSITE_VNET_ROUTE_ALL = true
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false

    
    # Settings for private Container Registires  
    DOCKER_REGISTRY_SERVER_URL      = "ACR location info not available."
    DOCKER_REGISTRY_SERVER_USERNAME = "ACR location info not available."
    DOCKER_REGISTRY_SERVER_PASSWORD = "ACR location info not available."
    
  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "ACR location info not available."
    always_on        = "true"
    ip_restriction {
      virtual_network_subnet_id = azurerm_virtual_network.Vnet.id
    }
  }

  identity {
    type = "SystemAssigned"
  }

  
}
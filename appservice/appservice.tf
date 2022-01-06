
resource "azurerm_application_insights" "webinsigts" {
  name                = "pinswebinsights"
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  application_type    = "web"
}

resource "azurerm_app_service_plan" "AppSrvPlan" {
  name                = var.AppSrvPlan
  location            = azurerm_resource_group.AppSrvRG.location
  resource_group_name = azurerm_resource_group.AppSrvRG.name
  kind                = "Linux"
  reserved            = true
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
    DOCKER_REGISTRY_SERVER_URL      = var.DockerRegUrl
    DOCKER_REGISTRY_SERVER_USERNAME = var.dockerusername
    DOCKER_REGISTRY_SERVER_PASSWORD = var.dockeruserpass

  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|nginx:latest"
    always_on        = "true"
    #ip_restriction {
    #  virtual_network_subnet_id = azurerm_virtual_network.Vnet.id
    #}
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "webswiftnetwork" {
  app_service_id = azurerm_app_service.webapp.id
  subnet_id      = azurerm_subnet.AppSubnets.id
  depends_on = [azurerm_subnet.AppSubnets]
}
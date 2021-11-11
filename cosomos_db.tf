resource "azurerm_cosmosdb_account" "db" {
  name                = "${local.resource_name_prefix}-${var.cosomos_db_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }


  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 350
    max_staleness_prefix    = 100002
  }

  geo_location {
    location          = "UK West"
    failover_priority = 1
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
}

resource "azurerm_role_assignment" "role_assignment2" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_app_service.app_service.identity.0.principal_id
}

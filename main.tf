locals {
  resource_group_name  = "eon-${var.environment_name}-rg"
  storage_account_name = "eon${var.environment_name}storage"

  tags = {
    owner = "Clemens Wältken"
  }
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location

  tags = local.tags

  lifecycle {
    ignore_changes = [tags["owner"]]
  }
}

resource "azurerm_storage_account" "default" {
  name = local.storage_account_name

  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

data "azurerm_client_config" "me" {
}

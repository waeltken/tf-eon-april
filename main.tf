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

  allow_nested_items_to_be_public = false

  blob_properties {
  }

  tags = local.tags
}

resource "azurerm_storage_container" "terraform" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.default.id
  container_access_type = "private"
}

output "storage_account_id" {
  value = azurerm_storage_account.default.id
}

data "azurerm_client_config" "me" {
}

data "azurerm_resource_group" "default" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "default" {
  name = var.storage_account_name

  location            = data.azurerm_resource_group.default.location
  resource_group_name = var.resource_group_name

  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false

  blob_properties {
    container_delete_retention_policy {
      days = 7
    }
    delete_retention_policy {
      days = 42
    }
  }

  tags = var.tags
}

resource "azurerm_storage_container" "state" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.default.id
  container_access_type = "private"
}

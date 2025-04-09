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

module "storage" {
  source = "./modules/blobstorage"

  resource_group_name  = azurerm_resource_group.default.name
  storage_account_name = local.storage_account_name

  tags = local.tags
}

output "storage_account_id" {
  value = module.storage.storage_account_id
}

data "azurerm_client_config" "me" {
}

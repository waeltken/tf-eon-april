terraform {
  backend "azurerm" {
    subscription_id      = "685dc6df-f715-40c9-91f3-ecf0aea044bd"
    resource_group_name  = "eon-april-rg"
    storage_account_name = "eonaprilstorage"
    container_name       = "tfstate"
    key                  = "eon-april.tfstate"
  }
}

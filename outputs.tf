output "subscription_id" {
  value = data.azurerm_client_config.me.subscription_id
}

output "location" {
  value = azurerm_resource_group.default.location
}

output "storage_account_url" {
  value = azurerm_storage_account.default.primary_blob_endpoint
}

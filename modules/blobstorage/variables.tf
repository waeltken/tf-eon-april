variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the storage account"
  type        = map(string)
  default     = {}
}

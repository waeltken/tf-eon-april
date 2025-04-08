variable "location" {
  description = "The Azure location to deploy resources into."
  type        = string
  default     = "swedencentral"

  validation {
    condition     = contains(["swedencentral", "germanywestcentral"], var.location)
    error_message = "The location must be either 'swedencentral' or 'germanywestcentral'."
  }
}

variable "environment_name" {
  description = "The name of the environment (e.g., dev, test, prod)."
  type        = string
  default     = "dev"
}

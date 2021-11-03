variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "resource_group_location" {
  description = "Location of the resource group"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
}

variable "app_service_name1" {
  description = "Name of the App Service"

}

variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "pins"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}

variable "app_insights_name" {
  description = "Name of the App Insights"
}

variable "storage_account_name" {
  description = "Name of the storage account"

}

variable "stoage_account_container_name" {
  description = "Name of the container"

}

variable "key_vault_name" {
  description = "Name of the Key Vault"

}

variable "app_service_name2" {
  description = "Name of the app service2 "
}


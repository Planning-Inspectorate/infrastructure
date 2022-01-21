variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "business_division" {
}

variable "resource_group_location" {
  description = "Location of the resource group"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
}

variable "appeals_document_service_api" {
  description = "Name of the App Service"

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

variable "appeals_service_api" {
  description = "Name of the app service2 "
}


variable "lpa_questionnaire" {
  description = "Name of the app service3"

}

variable "pdf_service_api" {
  description = "Name of the app service4"

}

variable "appeal_reply_service_api" {
  description = "Name of the app service5"

}
variable "forms_webappservice_api" {
  description = "Name of the app service"

}
variable "cosmos_db_name" {
  description = "Name of the db account"

}

variable "Service_bus_name" {
  description = "Name of the service bus"
}


# variable "vnetname" {
#   description = "Name of the vnet"
# }

variable "subnetname" {
  description = "Name of the subnet"
}

variable "horizon_function_dev" {
  description = "Name of the function app"
}

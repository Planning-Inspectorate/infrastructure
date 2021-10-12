variable "rg_name" {
  type        = string
  default     = "Azure-rg"
  description = "Provide the name of existing resource group to spin the resources"
}
variable "location" {
  type        = string
  description = "Azure Location"
  default     = "UK South"
}
variable "vnet_name" {
  type        = string
  default     = "newdev-vnet"
  description = "Existing Virtual Network Name"
}
variable "subnet_name" {
  type        = string
  default     = "newdev-subnet"
  description = "Existing Subnet Name"
}
variable "appplan_name" {
  type        = string
  default     = "newdev-appplan"
  description = "Existing App plan name"
}
variable "appeal_service_webapp_name" {
  type        = string
  default     = "newdev-appealsserviceapi"
  description = "Appeal Sevice Webapp Name"
}
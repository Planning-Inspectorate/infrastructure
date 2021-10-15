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
variable "servicebus_namepspace_name" {
  type        = string
  description = "Service bus Namespace Name"
  default     = "dev1-pins-uks-message-queue-dev"
}
variable "servicebus_namepspace_sku" {
  type        = string
  default     = "Basic"
  description = "Service bus SKU"
}
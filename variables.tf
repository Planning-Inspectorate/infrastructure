variable "ResourceGroup" {}
variable "Location" {}
variable "VnetName" {}
variable "VnetAddressSpace" {}
variable "AppSubnets" {
  type = map(any)
}
variable "AppSrvPlan" {}
variable "subnet_web" {
  
}
variable "gatewaysubnet" {}

# Key Vault test variables
# variable "kv-full-object-id" {
#   type = string
# }
variable "kv-sku-name" {
  type = string
  default = "standard"
}

variable "KeyVaultName" {
}

# Keyvault Secrets vars

variable "SitePipKey" {
  
}

variable "SitePipValue" {
  
}

variable "VpnIpsecKey" {
  
}

variable "VpnIpsecValue" {
  
}
variable "ResourceGroup" {}
variable "Location" {}
variable "VnetName" {}
variable "VnetAddressSpace" {}
variable "AppSrvPlan" {}
variable "subnet_web" {}
variable "gatewaysubnet" {}

# Key Vault test variables
# variable "kv-full-object-id" {
#   type = string
# }

variable "KeyVaultRG" {}
variable "KeyVaultName" {}
#variable "SitePip" {}
#variable "VpnIpsec" {}

#variable "DockerRegUrl" {}
#variable "dockerusername" {}
#variable "dockeruserpass" {}
# variable "DockerUserName" {}
# variable "DockerUserPass" {}
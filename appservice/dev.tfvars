ResourceGroup    = "pins-uk-applications-poc-test"
Location         = "uksouth"
VnetName         = "Vnet"
VnetAddressSpace = "10.4.0.0/16"

AppSubnets = {
  subnet_web = "10.4.0.0/24"
  #   GatewaySubnet       = "10.4.1.0/27"
}

subnet_web    = "10.4.0.0/24"
gatewaysubnet = "10.4.1.0/27"
AppSrvPlan    = "AppService"
KeyVaultName  = "pins-uks-vault-appdev1"
KeyVaultRG    = "vault"
SitePip      = "sitepipKey"
VpnIpsec     = "IpSecKey"


 
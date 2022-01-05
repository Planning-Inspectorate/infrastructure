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

DockerRegUrl = "https://registry.hub.docker.com/library/nginx"

KeyVaultName  = "pins-uks-vault-appln-dev"
KeyVaultRG    = "pins-uks-vault-appln-321"
#SitePip      = "sitepipKey"
#VpnIpsec     = "IpSecKey"


 
ResourceGroup    = "pins-uk-applications-poc-test"
Location         = "uksouth"
VnetName         = "Vnet"
VnetAddressSpace = "10.4.0.0/16"
subnet_web    = "10.4.0.0/24"
gatewaysubnet = "10.4.1.0/27"
AppSrvPlan    = "applicationserviceapi"

KeyVaultName  = "pins-uks-vault-appln-dev"
KeyVaultRG    = "pins-uks-vault-dev"


# Webservice

App_Insight_Name = "applications-service-web-app"
App_Service_Name = "applications-service-web-app-2"
IngestionEndpoint = "https://uksouth-1.in.applicationinsights.azure.com/"
ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
Docker_Registry_Server_URL = "https://pinscommonukscontainers3887default.azurecr.io"
Appliction_Service_API_URL = "https://applications-service-api.azurewebsites.net"
APPLICATIONS_SERVICE_API_TIMEOUT = "10000"
HOST_URL = "https://applications-service-web-app.azurewebsites.net"
SUBDOMAIN_OFFSET = "3"
USE_SECURE_SESSION_COOKIES  = "false"
WEBSITE_HTTPLOGGING_RETENTION_DAYS  = "3"
WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
XDT_MicrosoftApplicationInsights_Mode = "default"
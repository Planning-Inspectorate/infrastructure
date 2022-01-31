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
DOCKER_CUSTOM_IMAGE_NAME        = "pinscommonukscontainers3887default.azurecr.io/applications-forms-web-app:latest"


#APIService
FORMS_WEB_APP_HOST  = "51.104.28.75"
HAVING_YOUR_SAY_URL  = "https://applications-service-web-app.azurewebsites.net/"
LOGGER_LEVEL = "info"
MAGIC_LINK_DOMAIN  = "https://applications-service-web-app.azurewebsites.net/"
MYSQL_DATABASE  = "ipclive"
MYSQL_DIALECT  = "mysql"
MYSQL_HOST  = "10.222.0.6"
MYSQL_PORT  = "3306"
NODE_ENV  = "development"
PRELIMINARY_MEETING_URL = "https://applications-service-web-app.azurewebsites.net/"
SERVER_PORT = "3000"
SERVER_SHOW_ERRORS  = "true"
SERVER_TERMINATION_GRACE_PERIOD_SECONDS = "0"
TRIALIST_DATA_PATH  = "/opt/app/data/trialists.json"
API_WEBSITE_HTTPLOGGING_RETENTION_DAYS  = "7"
API_WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
API_XDT_MicrosoftApplicationInsights_Mode = "default"

# vpn

gateway_address = "51.104.42.155"
address_space   = "10.222.0.0/26"
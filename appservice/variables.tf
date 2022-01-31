variable "ResourceGroup" {}
variable "Location" {}
variable "VnetName" {}
variable "VnetAddressSpace" {}
variable "AppSrvPlan" {}
variable "subnet_web" {}
variable "gatewaysubnet" {}

variable "KeyVaultRG" {}
variable "KeyVaultName" {}
#webservice
variable "App_Insight_Name" {}
variable "App_Service_Name" {}
variable "IngestionEndpoint" {}
variable "ApplicationInsightsAgent_EXTENSION_VERSION" {}
variable "Docker_Registry_Server_URL" {}
variable "Appliction_Service_API_URL" {}
variable "APPLICATIONS_SERVICE_API_TIMEOUT" {}
variable "HOST_URL" {}
variable "SUBDOMAIN_OFFSET" {}
variable "USE_SECURE_SESSION_COOKIES" {}
variable "WEBSITE_HTTPLOGGING_RETENTION_DAYS" {}
variable "WEBSITES_ENABLE_APP_SERVICE_STORAGE" {}
variable "XDT_MicrosoftApplicationInsights_Mode" {}

#app service
variable "FORMS_WEB_APP_HOST" {}
variable "HAVING_YOUR_SAY_URL" {}
variable "LOGGER_LEVEL" {}
variable "MAGIC_LINK_DOMAIN" {}
variable "MYSQL_DATABASE" {}
variable "MYSQL_DIALECT" {}
variable "MYSQL_HOST" {}
variable "MYSQL_PORT" {}
variable "NODE_ENV" {}
variable "PRELIMINARY_MEETING_URL" {}
variable "SERVER_PORT" {}
variable "SERVER_SHOW_ERRORS" {}
variable "SERVER_TERMINATION_GRACE_PERIOD_SECONDS" {}
variable "TRIALIST_DATA_PATH"{}
variable "API_WEBSITE_HTTPLOGGING_RETENTION_DAYS" {}
variable "API_WEBSITES_ENABLE_APP_SERVICE_STORAGE" {}
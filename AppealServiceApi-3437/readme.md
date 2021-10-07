<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.79.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service.appeal_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service) | resource |
| [azurerm_app_service_virtual_network_swift_connection.appeal_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_app_service_plan.asp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/app_service_plan) | data source |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appeal_service_webapp_name"></a> [appeal\_service\_webapp\_name](#input\_appeal\_service\_webapp\_name) | Appeal Sevice Webapp Name | `string` | `"newdev-appealsserviceapi"` | no |
| <a name="input_appplan_name"></a> [appplan\_name](#input\_appplan\_name) | Existing App plan name | `string` | `"newdev-appplan"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Location | `string` | `"UK South"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Provide the name of existing resource group to spin the resources | `string` | `"Azure-rg"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Existing Subnet Name | `string` | `"newdev-subnet"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Existing Virtual Network Name | `string` | `"newdev-vnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appeal_service"></a> [appeal\_service](#output\_appeal\_service) | n/a |
<!-- END_TF_DOCS -->
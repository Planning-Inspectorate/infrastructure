<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_namespace.sbns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_queue.add-document](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue.create-contact](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue.horizon-householder-appeal-publish](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue.trigger-poc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure Location | `string` | `"UK South"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Provide the name of existing resource group to spin the resources | `string` | `"Azure-rg"` | no |
| <a name="input_servicebus_namepspace_name"></a> [servicebus\_namepspace\_name](#input\_servicebus\_namepspace\_name) | Service bus Namespace Name | `string` | `"dev1-pins-uks-message-queue-dev"` | no |
| <a name="input_servicebus_namepspace_sku"></a> [servicebus\_namepspace\_sku](#input\_servicebus\_namepspace\_sku) | Service bus SKU | `string` | `"Basic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appeal_service"></a> [appeal\_service](#output\_appeal\_service) | n/a |
<!-- END_TF_DOCS -->
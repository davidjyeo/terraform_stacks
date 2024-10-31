data "azapi_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-tfc-stack"
  location = var.location
}

resource "azapi_resource" "rg" {
  type      = "Microsoft.Resources/resourceGroups@2024-03-01"
  parent_id = data.azapi_client_config.current.subscription_id
  name      = "rg-tfc-azapi" #"${module.naming.resource_group.name}-01"
  location  = var.location
}




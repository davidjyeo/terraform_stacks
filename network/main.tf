locals {
  name = "${var.prefix}-net-${var.suffix}"
}

# resource "azurerm_resource_group" "main" {
#   name     = local.name
#   location = var.location
#   tags     = var.tags
# }

resource "azapi_resource" "rg" {
  type     = "Microsoft.Resources/resourceGroups@2024-03-01"
  name     = local.name #"rg-hcp-terraform" #"${module.naming.resource_group.name}-01"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = local.name
  resource_group_name = azapi_resource.rg.name #azurerm_resource_group.main.name
  location            = azapi_resource.rg.location
  address_space       = [var.cidr_range]
  tags                = var.tags
}

resource "azurerm_subnet" "main" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azapi_resource.rg.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = each.value
}

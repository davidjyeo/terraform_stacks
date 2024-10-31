locals {
  name = "${var.prefix}-net-${var.suffix}"
}

resource "azurerm_resource_group" "main" {
  name     = local.name
  location = var.location
  tags     = var.tags
}

module "rg" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  name     = local.name
  location = var.location
}


module "vnet" {
  source              = "Azure/avm-res-network-virtualnetwork/azurerm"
  name                = local.name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = [var.cidr_range]
}



# resource "azurerm_virtual_network" "main" {
#   name                = local.name
#   resource_group_name = azurerm_resource_group.main.name
#   location            = azurerm_resource_group.main.location
#   address_space       = [var.cidr_range]
#   tags                = var.tags
# }

# resource "azurerm_subnet" "main" {
#   for_each             = var.subnets
#   name                 = each.key
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = each.value
}

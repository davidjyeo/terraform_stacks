resource "azurerm_resource_group" "rg" {
  name     = "rg-tfc-stack"
  location = "UK South"
}

# resource "azapi_resource" "rg" {
#   type     = "Microsoft.Resources/resourceGroups@2024-03-01"
#   name     = "rg-hcp-terraform" #"${module.naming.resource_group.name}-01"
#   location = "UK South"
# }




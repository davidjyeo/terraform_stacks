component "resource_group" {
  source = "./resource-group"

  inputs = {
    location    = var.location
    name_suffix = var.name_suffix
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

# component "storage_account" {
#   source = "./modules/storage-account"

#   inputs = {
#     name_suffix    = var.name_suffix
#     resource_group = component.resource_group.resource_group
#   }

#   providers = {
#     azurerm = provider.azurerm.this
#     random  = provider.random.this
#   }
# }

# component "vm" {
#   source = "./vm"

#   inputs = {
#     location     = var.location
#     prefix       = var.prefix
#     suffix       = var.suffix
#     vm_subnet_id = component.network.subnet_ids[0]
#     tags         = var.tags
#   }

#   providers = {
#     azurerm = provider.azurerm.this
#     tls     = provider.tls.this
#     random  = provider.random.this
#     modtm   = provider.modtm.this
#   }
# }

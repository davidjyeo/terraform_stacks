component "resource_group" {
  source = "./modules/resource-group"

  inputs = {
    location    = var.location
    name_suffix = var.name_suffix
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

component "storage_account" {
  source = "./modules/storage-account"

  inputs = {
    name_suffix    = var.name_suffix
    resource_group = component.resource_group.resource_group
  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
  }
}

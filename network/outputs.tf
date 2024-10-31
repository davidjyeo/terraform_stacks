output "network_resource_group_name" {
  value = azapi_resource.rg.name
}

output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "subnet_ids" {
  value = [for subnet in azurerm_subnet.main : subnet.id]
}

output "subnet_map" {
  value = { for subnet in azurerm_subnet.main : subnet.name => subnet }
}

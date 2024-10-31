output "configuration" {
  value = {
    client_id       = azuread_service_principal.tfc_stacks.client_id
    tenant_id       = data.azurerm_subscription.current.tenant_id
    subscription_id = data.azurerm_subscription.current.subscription_id
  }
}

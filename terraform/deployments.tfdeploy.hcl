identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "development" {
  inputs = {
    location        = "uksouth"
    name_suffix     = "development"
    identity_token  = identity_token.azurerm.jwt
    subscription_id = "efa8a235-ebc8-496b-8fb5-4ae931cc12bf"
    client_id       = "88cedeb2-8819-4e62-92cf-20a945098585"
    tenant_id       = "88ef261e-b19b-4d71-9afd-cdac31a6dcda"
  }
}

orchestrate "auto_approve" "applyable" {
  check {
    condition = context.plan.applyable
    reason    = "Changes are not applyable"
  }
}

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "development" {
  inputs = {
    location    = "swedencentral"
    name_suffix = "development"

    identity_token  = identity_token.azurerm.jwt
    client_id       = "<your client id>"
    subscription_id = "<your subscription id>"
    tenant_id       = "<your tenant id>"
  }
}

orchestrate "auto_approve" "applyable" {
  check {
    condition = context.plan.applyable
    reason    = "Changes are not applyable"
  }
}

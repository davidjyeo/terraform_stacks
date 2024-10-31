locals {
  location = "uksouth"
  project  = "tfstack-testing"
}

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "88cedeb2-8819-4e62-92cf-20a945098585"
    subscription_id = "d0f6eb41-3e86-48da-bc57-893eab20796f"
    tenant_id       = "88ef261e-b19b-4d71-9afd-cdac31a6dcda"

    location   = local.location
    prefix     = "tfstack"
    suffix     = "644547"
    cidr_range = "10.0.0.0/16"
    subnets = {
      subnet1 = ["10.0.0.0/24"]
    }
    tags = {
      environment = "dev"
      project     = local.project
    }
  }
}

locals {
  location = "uksouth"
  project  = "tfstack-testing"
}

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "management" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "9d2c6371-5a3c-4f31-8808-0cfc11c65f58"
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
      environment = "management"
      project     = local.project
    }
  }
}

deployment "identity" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "9d2c6371-5a3c-4f31-8808-0cfc11c65f58"
    subscription_id = "1b4a4d10-fb8c-4d79-b28a-4d7469964f95"
    tenant_id       = "88ef261e-b19b-4d71-9afd-cdac31a6dcda"


    location   = local.location
    prefix     = "tfstack"
    suffix     = "644547"
    cidr_range = "10.0.0.0/16"
    subnets = {
      subnet1 = ["10.0.0.0/24"]
    }
    tags = {
      environment = "identity"
      project     = local.project
    }
  }
}

deployment "networking" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "9d2c6371-5a3c-4f31-8808-0cfc11c65f58"
    subscription_id = "efa8a235-ebc8-496b-8fb5-4ae931cc12bf"
    tenant_id       = "88ef261e-b19b-4d71-9afd-cdac31a6dcda"

    location   = local.location
    prefix     = "tfstack"
    suffix     = "644547"
    cidr_range = "10.0.0.0/16"
    subnets = {
      subnet1 = ["10.0.0.0/24"]
    }
    tags = {
      environment = "networking"
      project     = local.project
    }
  }
}

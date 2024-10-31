terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  subscription_id = "efa8a235-ebc8-496b-8fb5-4ae931cc12bf"
  # client_id       = "080c8627-412d-402e-80a8-3bed5c1f5de2"
  # client_secret   = "0jI8Q~M~_79jd5RrUjm7mBPyfOX14cJtvCU0Xbgx"
  # tenant_id       = "88ef261e-b19b-4d71-9afd-cdac31a6dcda"
  features {}
}

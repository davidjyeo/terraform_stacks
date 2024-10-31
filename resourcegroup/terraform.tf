terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>2.0" #version = "2.0.1"
    }
  }
}

data "azapi_client_config" "current" {}

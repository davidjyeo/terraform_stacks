terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  subscription_id = "d0f6eb41-3e86-48da-bc57-893eab20796f"
  features {}
}

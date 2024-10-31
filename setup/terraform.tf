terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    tfe = {
      source = "hashicorp/tfe"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  subscription_id = "d0f6eb41-3e86-48da-bc57-893eab20796f"
  features {}
}

provider "tfe" {
  token = "WVoLT1Vptk0pCw.atlasv1.8rKoaSEPzUW8xwqgAXg80Y8io3Z4vcSXGz0q3Woizt1fVn6N8zIGyQBQVfvvuUm0bBM"
}

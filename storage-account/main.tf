terraform {
  required_version = "~> 1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.3"
    }
  }
}

variable "name_suffix" {
  type        = string
  description = "Name suffix for resources"
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "Azure resource group object"
}

resource "random_string" "this" {
  lower   = true
  upper   = false
  numeric = true
  special = false
  length  = 5
}

resource "azurerm_storage_account" "this" {
  name                = "st${random_string.this.result}${var.name_suffix}"
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.41.0"
    }
  }
}
provider "azurerm" {
    features {}
}

data "azurerm_resource_group" "example" {
  name     = "stephyen-resg1"
}

resource "azurerm_storage_account" "example1" {
  name                     = "storageaccstephy1"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account" "example2" {
  name                     = "storageaccstephy2"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

terraform {
  backend "local" {}
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "example" {
  name     = "stephyen-resg2" # Modify this to your rg name if needed.
}

resource "azurerm_service_plan" "example" {
  name                = "stephasp1"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "stephwebapp1"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  https_only          = true 

#   commented out because not sure if correct.
#   auth_settings {
#     runtime_version = "DOTNETCORE|3.0"
#   }

  site_config {
    always_on         = false
    ftps_state        = "FtpsOnly"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service_source_control" "example" {
  app_id   = azurerm_linux_web_app.example.id
  repo_url = " "
  branch   = "master"
  use_manual_integration = true
}
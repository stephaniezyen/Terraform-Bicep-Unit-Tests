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

resource "azurerm_kubernetes_cluster" "example" {
  name                = "stephakstest1"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  dns_prefix          = "testaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}
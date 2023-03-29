provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "example" {
  name     = "stephyen-resg1"
}

resource "azurerm_mssql_server" "example" {
  name                         = "stephsqlserver1"
  resource_group_name          = data.azurerm_resource_group.example.name
  location                     = data.azurerm_resource_group.example.location
  version                      = "12.0" # required, doesn't exist in bicep
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "test" {
  name           = "stephsqldb1"
  server_id      = azurerm_mssql_server.example.id
  sku_name       = "S0" # I believe this corresponds to standard SKU and tier.
}
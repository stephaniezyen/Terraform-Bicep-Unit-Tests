param location string = resourceGroup().location

resource store1 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'storageaccstephy3'
  kind: 'StorageV2'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
}

resource store2 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'storageaccstephy4'
  kind: 'StorageV2'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
}
resource store3 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'storageaccstephy5'
  kind: 'StorageV2'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
}

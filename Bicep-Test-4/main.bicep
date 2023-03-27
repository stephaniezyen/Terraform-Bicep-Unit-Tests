targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01'existing ={
  name: 'stephyen-resg2'
}

module store 'storageacc.bicep' = {
  name: 'storeaccteststeph'
  scope: rg
}

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'stephyen-resg2'
  location: deployment().location
}

module vnet 'nsg.bicep' = {
  name: 'vnettest'
  scope: rg
}

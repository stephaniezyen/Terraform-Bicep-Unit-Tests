param locationrg string = resourceGroup().location

resource nsg 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
    name: 'stephsg2'
    location: locationrg
  }
  
  resource vnet 'Microsoft.Network/virtualNetworks@2020-05-01' = {
    name: 'stephvnet2'
    location: locationrg
    properties: {
      addressSpace: {
        addressPrefixes: [
          '10.0.0.0/16'
        ]
      }
    subnets: [
      {
        name: 'stephsubnet1'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'stephsubnet2'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}

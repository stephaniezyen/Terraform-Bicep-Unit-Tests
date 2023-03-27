param locationrg string = resourceGroup().location

resource nsg 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
    name: 'example-security-group'
    location: locationrg
  }
  
  resource vnet 'Microsoft.Network/virtualNetworks@2020-05-01' = {
    name: 'example-network'
    location: locationrg
    properties: {
      addressSpace: {
        addressPrefixes: [
          '10.0.0.0/16'
        ]
      }
    }
  }
  
  resource vnetName_subnet1 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
    parent: vnet
    location: locationrg
    name: 'subnet1'
    properties: {
      addressPrefix: '10.0.1.0/24'
    }
  }
  
  resource vnetName_subnet2 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
    parent: vnet
    location: locationrg
    name: 'subnet2'
    properties: {
      addressPrefix: '10.0.2.0/24'
    }
    dependsOn: [
      vnetName_subnet1
    ]
  }


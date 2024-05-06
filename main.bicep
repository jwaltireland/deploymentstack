targetScope = 'subscription'

// param resourceGroupLocation string = resourceGroup().location
param resourceGroupLocation string
param resourceGroupName string
param storageAccountName string = 'store${uniqueString(resourceGroup().id)}'
param vnetName string = 'vnet${uniqueString(resourceGroup().id)}'

var subId = '03378d13-d93f-4e73-bcb0-986d5a90f945'

module baseResourceGroup 'modules/resource_groups/main.bicep' =  {
  scope: subscription(subId)
  name: 'Deploy-base-RG'
  
  params: {
    name:resourceGroupName
    location: resourceGroupLocation 
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: resourceGroupLocation
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }

  dependsOn: [
    baseResourceGroup
]
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnetName
  location:resourceGroupLocation
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

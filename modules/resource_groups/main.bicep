targetScope='subscription'

param location string = 'eastus'
param name string = 'rg-test'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name:name
  location:location
}

@description('The name of the resource group.')
output name string = resourceGroup.name

@description('The resource ID of the resource group.')
output resourceId string = resourceGroup.id

@description('The location the resource was deployed into.')
output location string = resourceGroup.location

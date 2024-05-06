targetScope= 'subscription'

param resourceGroupName string = 'rg-bicep-depstack-01'
param resourceGroupLocation string = 'eastus'
param storageName string = 'stbicepdepstack001'
param storageLocation string = 'eastus'

// param virtualnetworkname string = 'vnet01'
// param virtualnetworklocation string = 'eastus'
// param subnet1Name string = 'alpha'
// param subnet2Name string= 'beta'

resource azrg01 'Microsoft.Resources/resourceGroups@2021-04-01'= {
  name: resourceGroupName
  location: resourceGroupLocation
  
}

//Azure Storage Account Module Deployment//
module storageAcct 'modules/storage_account/main.bicep'  = {
  name: 'storageModule'
  scope: azrg01
  params: {
    resourceGroupLocation: storageLocation
    storageAccountName: storageName
  }
}

//Azure Virtual Network Module Deployment//
/*module Vnet 'virtual_network.bicep'  = {
  name: 'networkModule'
  scope: azrg01
  params: {
    virtualnetworkname: virtualnetworkname
    virtualnetworklocation: virtualnetworklocation
    subnet1Name: subnet1Name
    subnet2Name: subnet2Name
  }
}
*/

targetScope= 'subscription'

param resourceGroupName string
param resourceGroupLocation string
param storageName string
param storageLocation string

// param virtualnetworkname string = 'vnet01'
// param virtualnetworklocation string = 'eastus'
// param subnet1Name string = 'alpha'
// param subnet2Name string= 'beta'

resource resGroup 'Microsoft.Resources/resourceGroups@2021-04-01'= {
  name: resourceGroupName
  location: resourceGroupLocation
  
}

//Azure Storage Account Module Deployment//
module storageAcct 'modules/storage_account/main.bicep'  = {
  name: 'storageModule'
  scope: resGroup
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

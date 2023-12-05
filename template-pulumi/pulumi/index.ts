import * as pulumi from "@pulumi/pulumi";
import * as resources from "@pulumi/azure-native/resources";
import * as storage from "@pulumi/azure-native/storage";
let config = new pulumi.Config();
let rg_name = config.require("rg_name");
let sa_name = config.require("sa_name");

// Create an Azure Resource Group
const resourceGroup = new resources.ResourceGroup(rg_name);

// Create an Azure resource (Storage Account)
const storageAccount = new storage.StorageAccount(sa_name, {
    resourceGroupName: resourceGroup.name,
    sku: {
        name: storage.SkuName.Standard_LRS,
    },
    kind: storage.Kind.StorageV2,
});

// Export the primary key of the Storage Account
const storageAccountKeys = storage.listStorageAccountKeysOutput({
    resourceGroupName: resourceGroup.name,
    accountName: storageAccount.name
});

export const primaryStorageKey = storageAccountKeys.keys[0].value;

# Deploy resources on Azure with Pulumi

Deploys an Azure Resource Group and Storage Account using Pulumi.

Here is the import you want to add in your Pulumi index.ts
`ts
let config = new pulumi.Config();
let rg_name = config.require("rg_name");
let sa_name = config.require("sa_name");
`

Then, you could use these variables like that:
`ts
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
`
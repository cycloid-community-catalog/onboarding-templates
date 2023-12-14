# Deploy resources on Azure with Pulumi
Deploys an Azure Resource Group and Storage Account using Pulumi.

Here is the process to build a stack with a Pulumi project.

First, create your stack from this Pulumi template.

Then, pull the updates in your local catalog repository:
`sh
git pull
`

Edit the Cycloid stack logo in `.cycloid.yml`. You can use this Azure Storage Account logo or any other that suits your needs:
`https://cycloid-demo-stacks-logo.s3.eu-west-1.amazonaws.com/azure-storage.svg`

Next, you will need to login to your Pulumi Cloud account:
`pulumi login`

Create a new Pulumi project for Azure:
`pulumi new azure-typescript`

In the Pulumi project creation script, please use `storage-account` as the project name.

Finally, you probably want to make use of the end-user selected choices on Storage Account name and Resource Group name. To do so, import the Pulumi config object in your `index.ts` file:
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

Finally update this documentation file to something more relevant for your stack, push the changes to your git repository and refresh the Cycloid service catalog.

You can now test it in Cycloid self-service protal as end-user by creating a project.
# stack-nodejs-aws

Build and deploy a Node.js web application on an AWS EC2 instance.

This stack will:
  * Create a VPC and subnets.
  * Create an EC2 instance and deploy the Web application via cloud-init.

# Details

**Jobs description**

  * `terraform-plan`: Terraform job that will simply make a plan of the infrastructure's stack. It is automatically triggered upon resources changes.
  * `terraform-apply`: Terraform job similar to the plan one, but will actually create/update everything that needs to. Please see the plan diff for a better understanding. It is automatically triggered upon tfstate file changes after terraform-plan job completes.
  * `terraform-destroy`: :warning: Terraform job meant to destroy the whole stack - **NO CONFIRMATION ASKED**. If triggered, the full project **WILL** be destroyed. Use with caution.

**Params**

|Name|Description|Type|Default|Required|
|---|---|:---:|:---:|:---:|
|`aws_access_key`|Amazon AWS access key for Terraform. see value format [Here](https://docs.cycloid.io/advanced-guide/integrate-and-use-cycloid-credentials-manager.html#vault-in-the-pipeline)|`-`|`((aws_aws.access_key))`|`True`|
|`aws_secret_key`|Amazon AWS secret key for Terraform. see value format [Here](https://docs.cycloid.io/advanced-guide/integrate-and-use-cycloid-credentials-manager.html#vault-in-the-pipeline)|`-`|`((aws_aws.secret_key))`|`True`|
|`aws_region`|Amazon AWS region to use for Terraform.|`-`|`eu-west-1`|`True`|
|`git_repository`|Git repository url containing the config of the stack.|`-`|`git@github.com:cycloidio/cycloid-stacks-test.git`|`True`|
|`git_branch`|Branch of the config git repository.|`-`|`config`|`True`|
|`git_private_key`|SSH key pair to fetch the config git repository.|`-`|`((git_github.ssh_key))`|`True`|
|`terraform_storage_bucket_name`|AWS S3 bucket name to store terraform remote state file.|`-`|`($ organization_canonical $)-terraform-remote-state`|`True`|


## Terraform

**Inputs**

|Name|Description|Type|Default|Required|
|---|---|:---:|:---:|:---:|
|`cidr`|The CIDR of the VPC|`-`|`10.0.0.0/16`|`False`|
|`private_subnets`|The private subnets for the VPC|`list`|`["10.0.1.0/24"]`|`False`|
|`public_subnets`|The public subnets for the VPC|`list`|`["10.0.0.0/24"]`|`False`|
|`bastion_instance_type`|Instance type for the bastion|`-`|`t3a.micro`|`True`|
|`bastion_allowed_networks`|Networks allowed to connect to the bastion using SSH|`list`|`["0.0.0.0/0"]`|`False`|
|`nexus_instance_type`|Instance type for the Nexus Repository|`-`|`t3a.medium`|`True`|
|`nexus_port`|Disk size for the Nexus Repository|`-`|`20`|`False`|
|`nexus_disk_size`|Port where Nexus Repository service is exposed|`-`|`8081`|`True`|
|`nexus_admin_password`|Initial admin password for Nexus Repository|`-`|`changeme`|`True`|

**Outputs**

| Name | Description |
|------|-------------|
| vpc_id | The VPC ID for the VPC |
| vpc_cidr | The CIDR of the VPC |
| private_subnets | The private subnets for the VPC |
| public_subnets | The public subnets for the VPC |
| bastion_ip | The EIP attached to the bastion EC2 server |
| bastion_user | The username to use to connect to the bastion EC2 server |
| bastion_allowed_networks | Networks allowed to connect to the bastion using SSH |
| bastion_sg | The bastion security group ID. |
| bastion_sg_allow | The security group ID to allow SSH traffic from the bastion to the instances in the VPC |
| nexus_ip | The IP address the Nexus Repository server. |
| nexus_port | Port where Nexus Repository service is exposed. |
| nexus_os_user | The username to use to connect to the Nexus Repository EC2 server. Set to 'admin' because we use debian OS. |
| nexus_admin_password | Initial admin password in case of first installation. |
| nexus_sg | The Nexus Repository security group ID. |
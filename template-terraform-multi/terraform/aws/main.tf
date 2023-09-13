module "s3" {
  #####################################
  # Do not modify the following lines #
  # source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//aws/s3"
  source   = "./module-s3"
  project  = var.project
  env      = var.env
  customer = var.customer
  #####################################

  #. extra_tags (optional): {}
  #+ Dict of extra tags to add on resources. format { "foo" = "bar" }.
  extra_tags = {
    demo = true
    monitoring_discovery = false
  }

  #
  # Instance
  #
  
  count = var.create_storage ? 1 : 0

  #. s3_bucket_name: ''
  #+ Name of the S3 bucket
  s3_bucket_name = "Value injected by StackForms"

}

module "rds" {
  #####################################
  # Do not modify the following lines #
  # source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//aws/rds"
  source   = "./module-rds"
  project  = var.project
  env      = var.env
  customer = var.customer
  #####################################

  #. extra_tags (optional): {}
  #+ Dict of extra tags to add on resources. format { "foo" = "bar" }.
  extra_tags = {
    demo = true
    monitoring_discovery = false
  }

  #
  # Network
  #
  
  count = var.create_database ? 1 : 0

  #. vpc_id: ''
  #+ The ID for the VPC
  vpc_id = ""

  #
  # RDS
  #

  #. rds_engine: ''
  #+ DB engine. Engine values include aurora, aurora-mysql, aurora-postgresql, docdb, mariadb, mysql, neptune, oracle-ee, oracle-se, oracle-se1, oracle-se2, postgres, sqlserver-ee, sqlserver-ex, sqlserver-se, and sqlserver-web
  rds_engine = "mysql"

  #. rds_instance_class: 't3.micro'
  #+ Instance type for the VM
  rds_instance_class = "db.t3.medium"

  #. rds_allocated_storage: 32
  #+ Disk size for the VM (Go)
  rds_allocated_storage = "32"

  #. rds_database_name: 32
  #+ Database name to create in the RDS instance
  rds_database_name = "db01"

  #. rds_username: rds_user
  #+ Username to connect to the RDS instance
  rds_username = "rds_user"

}

module "ec2" {
  #####################################
  # Do not modify the following lines #
  # source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//aws/ec2"
  source   = "./module-ec2"
  project  = var.project
  env      = var.env
  customer = var.customer
  #####################################

  #. extra_tags (optional): {}
  #+ Dict of extra tags to add on resources. format { "foo" = "bar" }.
  extra_tags = {
    demo = true
    monitoring_discovery = false
  }

  #
  # Instance
  #
  
  count = var.create_instance ? 1 : 0

  #. subnet_id: ''
  #+ Subnet ID where to deploy the EC2 instance
  subnet_id = "Value injected by StackForms"

  #. vm_instance_type: 't3.micro'
  #+ Instance type for the VM
  vm_instance_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = "Value injected by StackForms"

  #. keypair_public: ""
  #+ The public SSH key, for SSH access to newly-created instances
  keypair_public = var.keypair_public
}

# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

# VPC
variable "vpc_id" {
  description = "The ID for the VPC"
}

# RDS
variable "rds_engine" {
  description = "DB engine. Engine values include aurora, aurora-mysql, aurora-postgresql, docdb, mariadb, mysql, neptune, oracle-ee, oracle-se, oracle-se1, oracle-se2, postgres, sqlserver-ee, sqlserver-ex, sqlserver-se, and sqlserver-web."
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "DB engine varsion"
  default     = "5.7"
}

variable "rds_username" {
  description = "Username to connect to the RDS instance"
  default = "rds_user"
}

variable "rds_database_name" {
  description = "Database name to create in the RDS instance"
  default = "db01"
}

variable "rds_allocated_storage" {
  description = "Disk size for the RDS instance (Go)"
  default = "32"
}

variable "rds_instance_class" {
  description = "RDS instance type."
  default     = "db.t3.medium"
}

variable "rds_iops" {
  description = "IOPS for the DB cluster"
  default = "2500"
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  standard_tags = {
    "cycloid" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}
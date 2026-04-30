terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cycloid = {
      source = "cycloidio/cycloid"
      version = ">= 0.0.20"
    }
  }
}
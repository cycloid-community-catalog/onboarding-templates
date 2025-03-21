provider "aws" {
  access_key = var.aws_cred.access_key
  secret_key = var.aws_cred.secret_key
  region     = var.aws_region

  default_tags { # The default_tags block applies tags to all resources managed by this provider, except for the Auto Scaling groups (ASG).
    tags = {
      cycloid      = true
      cycloid_org  = var.cy_org
      cycloid_pro  = var.cy_pro
      cycloid_env  = var.cy_env
      cycloid_com  = var.cy_com
      demo         = true
      monitoring_discovery = false
    }
  }
}
provider "aws" {
  access_key = var.aws_cred.access_key
  secret_key = var.aws_cred.secret_key
  region     = var.aws_region

  default_tags { # The default_tags block applies tags to all resources managed by this provider, except for the Auto Scaling groups (ASG).
    tags = {
      cycloid      = true
      cy_org  = var.cy_org
      cy_project  = var.cy_project
      cy_env  = var.cy_env
      cy_component  = var.cy_component
      demo         = true
      monitoring_discovery = false
    }
  }
}

provider "cycloid" {
  default_organization = var.cy_org
  api_key                = var.cy_api_key
  api_url                = var.cy_api_url
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.19.0"

  name = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  
  azs                 = ["${var.aws_region}a"]
  cidr                = "10.77.0.0/16"
  private_subnets     = ["10.77.0.0/19"]
  public_subnets      = ["10.77.96.0/19"]

  enable_nat_gateway      = false
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true
}
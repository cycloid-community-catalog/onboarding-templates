data "aws_availability_zones" "available" {
  count = var.create_network ? 1 : 0

  state = "available"
}

data "aws_subnet" "selected" {
  count = var.create_network ? 0 : 1

  id = var.subnet_id
}

module "vpc" {
  count = var.create_network ? 1 : 0

  source = "terraform-aws-modules/vpc/aws"

  name = "${var.customer}-${var.project}-${var.env}-nexus-vpc"
  cidr = "10.0.0.0/16"

  azs             = [data.aws_availability_zones.available.names[0]]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = merge(local.merged_tags, {
    Name       = "${var.customer}-${var.project}-${var.env}-nexus"
    role       = "nexus"
  })
}

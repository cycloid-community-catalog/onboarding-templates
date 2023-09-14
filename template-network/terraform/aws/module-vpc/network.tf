# VPC
resource "aws_vpc" "infra" {
  cidr_block = var.vpc_cidr

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-vpc"
    role = "vpc"
  })
}

# Internet Gateway
resource "aws_internet_gateway" "infra" {
  vpc_id = aws_vpc.infra.id

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-ig"
    role = "internet_gateway"
  })
}


# Public Subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.infra.id
  cidr_block = var.vpc_public_subnet
  map_public_ip_on_launch = true

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-public-subnet"
    role = "subnet"
    Tier = "Public"
  })
}


# Private Subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.infra.id
  cidr_block = var.vpc_private_subnet
  map_public_ip_on_launch = false

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-private-subnet"
    role = "subnet"
    Tier = "Private"
  })
}


# Route table which uses our internet gateway to access the internet
resource "aws_route_table" "infra" {
  vpc_id = aws_vpc.infra.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.infra.id
  }

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-route_table-demo"
    role = "route_table"
  })
}

# Associate route table with the subnet to make our subnet public
resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.infra.id
}
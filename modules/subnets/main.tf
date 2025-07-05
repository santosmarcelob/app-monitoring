resource "aws_subnet" "public_subnet1" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnets["public_subnet1"]
  availability_zone = var.availability_zones["az1"]
  tags = {
    Name = "Subnet1-${var.tags}"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnets["public_subnet2"]
  availability_zone = var.availability_zones["az2"]

  tags = {
    Name = "Subnet2-${var.tags}"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnets["private_subnet1"]
  availability_zone = var.availability_zones["az2"]


  tags = {
    Name = "Subnet3-${var.tags}"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnets["private_subnet2"]
  availability_zone = var.availability_zones["az2"]

  tags = {
    Name = "Subnet4-${var.tags}"
  }
}



terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
      
    }
  }
}

provider "aws" {
  # Region configuration 
    region = var.region
}

module "vpc" {
  source = "./modules/vpc" 
  vpc_cidr_block = var.vpc_cidr_block
}

module "subnets" {
  source = "./modules/subnets" 
  depends_on = [ module.vpc ]
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
  availability_zones = var.availability_zones
  tags = var.tags
}

module "internet_gateway" {
  depends_on = [ module.vpc ]
  source = "./modules/internet_gateway" 
  vpc_id  = module.vpc.vpc_id
  tags = var.tags
}

module "security_group" {
  source = "./modules/security_group" 
  vpc_id  = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
}

module "route_table" {
  source = "./modules/route_table" 
  depends_on = [ module.vpc ]
  vpc_id  = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
  igw_id = module.internet_gateway.igw_id
  subnet_id = module.subnets.public_subnet1
  tags = var.tags
}

module "instances" {
  depends_on = [ module.security_group,module.vpc,module.subnets ]
  source = "./modules/instances"
  public_subnet1 = module.subnets.public_subnet1
  private_subnet1 = module.subnets.private_subnet1
  private_subnet2 = module.subnets.private_subnet2
  vpc_security_group_ids = [module.security_group.sg_id, module.security_group.private_sg_id]
  tags = var.tags
}

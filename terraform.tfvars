
# VPC CIDR
vpc_cidr_block = "200.168.10.0/24"

# Region
region = "us-east-1"

# Subnet CIDRs
subnets = {
  public_subnet1  = "200.168.10.16/28"
  public_subnet2  = "200.168.10.32/28"
  private_subnet1 = "200.168.10.48/28"
  private_subnet2 = "200.168.10.64/28"
} 

# AZs
availability_zones = {
  az1 = "us-east-1a"
  az2 = "us-east-1b"
}

# Tags
tags = "Deploying-Via-Terraform"
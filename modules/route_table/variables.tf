variable "vpc_id" {
    description = "ID of the VPC that the desired Route Table belongs to."
}

variable "vpc_cidr_block" {
    description = "CIDR block of the route."
  
}

variable "igw_id" {
    description = "Internet Gateway ID."
  
}

variable "subnet_id" {
    description = "ID of a Subnet which is connected to the Route Table (not exported if not passed as a parameter"
}

variable "tags" {
  description = "Map of tags, each pair of which must exactly match a pair on the desired Internet Gateway."
  type = string
  
}

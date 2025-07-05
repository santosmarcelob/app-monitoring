variable "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using "

}

variable "region" {
  description = "value"
  type = string
}

variable "subnets" {
  description = "Map of subnet CIDR blocks by subnet name."
  type        = map(string)
}

variable "tags" {
  type        = string
  description = "Common tags to apply to resources for identification and cost allocation."
}


variable "availability_zones" {
  description = "Map of availability zones for the subnets."
  type        = map(string)
}
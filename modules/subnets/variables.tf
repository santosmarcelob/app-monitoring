variable "vpc_id" {
  description = "ID of the VPC that the desired subnet belongs to"
}

variable "subnets" {
  description = "Map of subnet CIDR blocks by subnet name."
  type        = map(string)
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type = string
}

variable "availability_zones" {
  description = "Map of availability zones for the subnets."
  type        = map(string)
}
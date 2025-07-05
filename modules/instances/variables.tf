variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type = string
  
}

variable "public_subnet1" {
  type        = string
  description = "The first public subnet used for deploying resources with public access."
}


variable "vpc_security_group_ids" {
  type = list(string)
  
}

variable "private_subnet1" {
  type        = string
  description = "The first private subnet used for internal resources without direct internet access."
}

variable "private_subnet2" {
  type        = string
  description = "The second private subnet used for internal resources without direct internet access."
}

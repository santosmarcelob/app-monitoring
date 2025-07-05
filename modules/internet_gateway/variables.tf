variable "vpc_id" {
   description = "ID of an attached VPC"
}

variable "tags" {
  description = "Map of tags, each pair of which must exactly match a pair on the desired Internet Gateway."
  type = string
  
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "internet_gateway_id" {
  value = module.internet_gateway.igw_id
}

output "subnets_id" {
  value = {
    private_subnet1 = module.subnets.private_subnet1
    private_subnet2 = module.subnets.private_subnet2
  }
}

output "sg_id" {
  value = module.security_group.sg_id  
}
output "route_table_id" {
  value = module.route_table.route_table_id
}

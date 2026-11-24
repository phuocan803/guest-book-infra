output "vpc_id" { value = module.vpc.vpc_id }
output "public_subnet_id" { value = module.vpc.public_subnets[0] }
output "private_subnet_id" { value = module.vpc.private_subnets[0] }
output "internet_gateway_id" { value = module.vpc.igw_id }
output "nat_gateway_ids" { value = module.vpc.natgw_ids }
output "nat_public_ips" { value = module.vpc.nat_public_ips }
output "public_route_table_ids" { value = module.vpc.public_route_table_ids }
output "private_route_table_ids" { value = module.vpc.private_route_table_ids }
output "default_security_group_id" { value = module.vpc.default_security_group_id }


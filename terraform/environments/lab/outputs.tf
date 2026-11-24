output "inventory" {
  value = {
    vpc_id                    = module.network.vpc_id
    public_subnet_id          = module.network.public_subnet_id
    private_subnet_id         = module.network.private_subnet_id
    internet_gateway_id       = module.network.internet_gateway_id
    nat_gateway_id            = module.network.nat_gateway_ids[0]
    nat_public_ip             = module.network.nat_public_ips[0]
    public_route_table_id     = module.network.public_route_table_ids[0]
    private_route_table_id    = module.network.private_route_table_ids[0]
    default_security_group_id = module.security.default_security_group_id
    public_security_group_id  = module.security.public_security_group_id
    private_security_group_id = module.security.private_security_group_id
    public_instance_id        = module.compute.public_instance_id
    private_instance_id       = module.compute.private_instance_id
    public_ip                 = module.compute.public_ip
    private_ip                = module.compute.private_ip
  }
}

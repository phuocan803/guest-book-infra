module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.5.1"

  name = var.name
  cidr = var.vpc_cidr
  azs  = [var.availability_zone]

  public_subnets  = [var.public_subnet_cidr]
  private_subnets = [var.private_subnet_cidr]

  enable_dns_support   = true
  enable_dns_hostnames = true
  create_igw           = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  map_public_ip_on_launch       = false
  manage_default_security_group = false
  manage_default_network_acl    = false
  manage_default_route_table    = false
  tags                          = var.tags
}

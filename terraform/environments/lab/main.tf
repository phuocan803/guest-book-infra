module "network" {
  source              = "../../modules/network"
  name                = var.name
  availability_zone   = var.availability_zone
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  tags                = var.tags
}

module "security" {
  source     = "../../modules/security"
  name       = var.name
  vpc_id     = module.network.vpc_id
  admin_cidr = var.admin_cidr
  tags       = var.tags
}

module "compute" {
  source                    = "../../modules/compute"
  name                      = var.name
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  public_subnet_id          = module.network.public_subnet_id
  private_subnet_id         = module.network.private_subnet_id
  public_security_group_id  = module.security.public_security_group_id
  private_security_group_id = module.security.private_security_group_id
  tags                      = var.tags
}

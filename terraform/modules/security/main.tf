module "public" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "${var.name}-public-ec2"
  description = "SSH from the administrator only"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Administrator SSH"
    cidr_blocks = var.admin_cidr
  }]
  egress_rules = ["all-all"]
  tags         = var.tags
}

module "private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "${var.name}-private-ec2"
  description = "SSH from the public EC2 security group only"
  vpc_id      = var.vpc_id

  computed_ingress_with_source_security_group_id = [{
    from_port                = 22
    to_port                  = 22
    protocol                 = "tcp"
    description              = "Bastion SSH"
    source_security_group_id = module.public.security_group_id
  }]
  number_of_computed_ingress_with_source_security_group_id = 1
  egress_rules                                             = ["all-all"]
  tags                                                     = var.tags
}

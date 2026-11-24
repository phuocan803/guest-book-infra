module "public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.1"

  name                        = "${var.name}-public"
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_security_group_id]
  associate_public_ip_address = true
  create_security_group       = false
  metadata_options = {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  root_block_device = {
    type                  = "gp3"
    size                  = 8
    encrypted             = true
    delete_on_termination = true
  }
  tags = var.tags
}

module "private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.1"

  name                        = "${var.name}-private"
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_security_group_id]
  associate_public_ip_address = false
  create_security_group       = false
  metadata_options = {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  root_block_device = {
    type                  = "gp3"
    size                  = 8
    encrypted             = true
    delete_on_termination = true
  }
  tags = var.tags
}

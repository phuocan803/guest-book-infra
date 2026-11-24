output "public_security_group_id" { value = module.public.security_group_id }
output "private_security_group_id" { value = module.private.security_group_id }
output "default_security_group_id" { value = aws_default_security_group.this.id }


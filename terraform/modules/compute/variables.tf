variable "name" { type = string }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "key_name" { type = string }
variable "public_subnet_id" { type = string }
variable "private_subnet_id" { type = string }
variable "public_security_group_id" { type = string }
variable "private_security_group_id" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}

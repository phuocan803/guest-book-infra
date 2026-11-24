variable "aws_region" { type = string }
variable "name" { type = string }
variable "availability_zone" { type = string }
variable "vpc_cidr" { type = string }
variable "public_subnet_cidr" { type = string }
variable "private_subnet_cidr" { type = string }
variable "admin_cidr" { type = string }
variable "ami_id" { type = string }
variable "key_name" { type = string }
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "tags" {
  type    = map(string)
  default = {}
}

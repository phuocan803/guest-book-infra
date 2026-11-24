variable "name" { type = string }
variable "availability_zone" { type = string }
variable "vpc_cidr" {
  type = string
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Use a valid IPv4 CIDR for the VPC."
  }
}
variable "public_subnet_cidr" { type = string }
variable "private_subnet_cidr" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}

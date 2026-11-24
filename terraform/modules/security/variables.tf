variable "name" { type = string }
variable "vpc_id" { type = string }
variable "admin_cidr" {
  type = string
  validation {
    condition     = can(cidrnetmask(var.admin_cidr)) && endswith(var.admin_cidr, "/32")
    error_message = "Set one administrator IPv4 address with a /32 prefix."
  }
}
variable "tags" {
  type    = map(string)
  default = {}
}



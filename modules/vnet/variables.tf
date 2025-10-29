variable "location" {}
variable "env" {}
variable "code" {}
variable "cidr" {}
variable "rg_name" {}
variable "subnets" {
  type = map(object({
    name           = string
    address_prefix = string
    security_group = string
  }))
}

# common
variable "location" {
  description = "Location for all resources."
  type        = string
}
variable "env" {
  description = "Environment name."
  type        = string
}
variable "code" {
  description = "Project code."
  type        = string
}

# vnet module specific
variable "cidr" {
  description = "CIDR block for the virtual network."
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create in the virtual network."
  type = map(object({
    name           = string
    address_prefix = string
    security_group = string
  }))
}

# bastion module specific
variable "bastion_sku" {
  description = "SKU for the Azure Bastion host."
  type        = string
  default     = "Basic"
  validation {
    condition     = contains(["Basic", "Standard", "Developer", "Premium"], var.bastion_sku)
    error_message = "Invalid bastion_sku. Allowed values are: Basic, Standard, Developer, Premium."
  }
}

# vm module specific
variable "vm_linux_size" {
  description = "Size of the Linux VM."
  type        = string
}

variable "vm_linux_admin_username" {
  description = "Admin username for the Linux VM."
  type        = string
}

variable "vm_linux_admin_password" {
  description = "Admin password for the Linux VM."
  type        = string
}

variable "vm_linux_img_publisher" {
  description = "Publisher of the Linux VM image."
  type        = string
}

variable "vm_linux_img_offer" {
  description = "Offer of the Linux VM image."
  type        = string
}

variable "vm_linux_img_sku" {
  description = "SKU of the Linux VM image."
  type        = string
}

variable "vm_linux_img_version" {
  description = "Version of the Linux VM image."
  type        = string
}


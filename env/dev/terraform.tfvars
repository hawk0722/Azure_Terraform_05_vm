# common
location = "japaneast"
env      = "dev"
code     = "demo"

# vnet module specific
cidr = "10.0.0.0/16"

subnets = {
  bastion = {
    name           = "AzureBastionSubnet"
    address_prefix = "10.0.0.0/26"
    security_group = "nsg-bas"
  },
  subnet1 = {
    name           = "snet-public"
    address_prefix = "10.0.1.0/24"
    security_group = "nsg-public"
  },
  subnet2 = {
    name           = "snet-private"
    address_prefix = "10.0.2.0/24"
    security_group = "nsg-private"
  }
}

# bastion module specific
bastion_sku = "Basic"

# vm module specific
vm_linux_size           = "Standard_D4ls_v6"
vm_linux_admin_username = "adminuser"
vm_linux_admin_password = "P@ssword@12345"
vm_linux_img_publisher  = "Canonical"
vm_linux_img_offer      = "ubuntu-24_04-lts"
vm_linux_img_sku        = "server"
vm_linux_img_version    = "latest"

module "rg" {
  source = "../../modules/rg"

  location = var.location
  env      = var.env
  code     = var.code
}

module "vnet" {
  source = "../../modules/vnet"

  location = var.location
  env      = var.env
  code     = var.code
  cidr     = var.cidr
  subnets  = var.subnets

  rg_name = module.rg.rg_name
}

module "nsg" {
  source = "../../modules/nsg"

  location = var.location
  env      = var.env
  code     = var.code

  rg_name           = module.rg.rg_name
  subnet_bastion_id = module.vnet.snet_bastion_id
  subnet_public_id  = module.vnet.snet_public_id
  subnet_private_id = module.vnet.snet_private_id
}

module "bas" {
  source = "../../modules/bas"

  location    = var.location
  env         = var.env
  code        = var.code
  bastion_sku = var.bastion_sku

  rg_name           = module.rg.rg_name
  subnet_bastion_id = module.vnet.snet_bastion_id
}

module "vm_linux" {
  source = "../../modules/vm_linux"

  location                = var.location
  env                     = var.env
  code                    = var.code
  cidr                    = var.cidr
  vm_linux_size           = var.vm_linux_size
  vm_linux_admin_username = var.vm_linux_admin_username
  vm_linux_admin_password = var.vm_linux_admin_password
  vm_linux_img_publisher  = var.vm_linux_img_publisher
  vm_linux_img_offer      = var.vm_linux_img_offer
  vm_linux_img_sku        = var.vm_linux_img_sku
  vm_linux_img_version    = var.vm_linux_img_version

  rg_name           = module.rg.rg_name
  subnet_public_id  = module.vnet.snet_public_id
  subnet_private_id = module.vnet.snet_private_id
}

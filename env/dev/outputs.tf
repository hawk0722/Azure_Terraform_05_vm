# Output to terminal screen.
output "rg_name" {
  value = module.rg.rg_name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "nsg_name_bastion" {
  value = module.nsg.nsg_name_bastion
}

output "nsg_name_public" {
  value = module.nsg.nsg_name_public
}

output "nsg_name_private" {
  value = module.nsg.nsg_name_private
}

output "bastion_name" {
  value = module.bas.bastion_name
}

output "vm_linux_p4d_name" {
  value = module.vm_linux.vm_name_p4d
}

output "vm_linux_p4p_name" {
  value = module.vm_linux.vm_name_p4p
}

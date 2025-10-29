output "nsg_name_bastion" {
  value = azurerm_network_security_group.nsg_bastion.name
}

output "nsg_name_public" {
  value = azurerm_network_security_group.nsg_public.name
}

output "nsg_name_private" {
  value = azurerm_network_security_group.nsg_private.name
}

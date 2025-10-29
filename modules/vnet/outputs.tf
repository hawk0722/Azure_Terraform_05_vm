output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "snet_public_id" {
  value = azurerm_subnet.snet["subnet1"].id
}

output "snet_private_id" {
  value = azurerm_subnet.snet["subnet2"].id
}

output "snet_bastion_id" {
  value = azurerm_subnet.snet["bastion"].id
}

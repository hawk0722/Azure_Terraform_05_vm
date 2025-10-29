# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.env}-${var.code}"
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = [var.cidr]
}

resource "azurerm_subnet" "snet" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_public_ip" "bas" {
  name                = "pip-${var.env}-${var.code}-bas"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bas" {
  name                = "bas-${var.env}-${var.code}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.bastion_sku

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_bastion_id
    public_ip_address_id = azurerm_public_ip.bas.id
  }
}

locals {
  custom_data_p4d = <<CUSTOM_DATA
#!/bin/bash
wget https://package.perforce.com/perforce.pubkey
gpg -n --import --import-options import-show perforce.pubkey
gpg -n --import --import-options import-show perforce.pubkey | grep -q "E58131C0AEA7B082C6DC4C937123CB760FF18869" && echo "true"
wget -qO - https://package.perforce.com/perforce.pubkey
gpg --dearmor < perforce.pubkey > perforce.gpg
mv perforce.gpg /usr/share/keyrings/perforce.gpg
echo "deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/ubuntu noble release" > /etc/apt/sources.list.d/perforce.list
apt-get update
apt-get install -y helix-p4d
CUSTOM_DATA
}

locals {
  custom_data_p4p = <<CUSTOM_DATA
#!/bin/bash
wget https://package.perforce.com/perforce.pubkey
gpg -n --import --import-options import-show perforce.pubkey
gpg -n --import --import-options import-show perforce.pubkey | grep -q "E58131C0AEA7B082C6DC4C937123CB760FF18869" && echo "true"
wget -qO - https://package.perforce.com/perforce.pubkey
gpg --dearmor < perforce.pubkey > perforce.gpg
mv perforce.gpg /usr/share/keyrings/perforce.gpg
echo "deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/ubuntu noble release" > /etc/apt/sources.list.d/perforce.list
apt-get update
apt-get install -y helix-cli helix-proxy
CUSTOM_DATA
}

# For p4d Linux VM
resource "azurerm_network_interface" "nic_p4d" {
  name                = "nic-linux-${var.env}-${var.code}-p4d"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "vm-linux-${var.env}-${var.code}-ip-configuration"
    subnet_id                     = var.subnet_private_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm_linux_p4d" {
  name                = "vm-linux-${var.env}-${var.code}-p4d"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_linux_size
  admin_username      = var.vm_linux_admin_username
  admin_password      = var.vm_linux_admin_password
  network_interface_ids = [
    azurerm_network_interface.nic_p4d.id
  ]

  custom_data                     = base64encode(local.custom_data_p4d)
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_linux_img_publisher
    offer     = var.vm_linux_img_offer
    sku       = var.vm_linux_img_sku
    version   = var.vm_linux_img_version
  }
}

# Por p4p Linux VM
resource "azurerm_public_ip" "pip_p4p" {
  name                = "pip-linux-${var.env}-${var.code}-p4p"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic_p4p" {
  name                = "nic-linux-${var.env}-${var.code}-p4p"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "vm-linux-${var.env}-${var.code}-ip-configuration"
    subnet_id                     = var.subnet_public_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_p4p.id
  }
}

resource "azurerm_linux_virtual_machine" "vm_linux_p4p" {
  name                = "vm-linux-${var.env}-${var.code}-p4p"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_linux_size
  admin_username      = var.vm_linux_admin_username
  admin_password      = var.vm_linux_admin_password
  network_interface_ids = [
    azurerm_network_interface.nic_p4p.id,
  ]

  custom_data                     = base64encode(local.custom_data_p4p)
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_linux_img_publisher
    offer     = var.vm_linux_img_offer
    sku       = var.vm_linux_img_sku
    version   = var.vm_linux_img_version
  }
}


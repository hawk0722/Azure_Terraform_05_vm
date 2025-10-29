resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.env}-${var.code}"
  location = var.location

  tags = {
    DoNotDelete = "True"
  }
}
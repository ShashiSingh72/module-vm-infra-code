data "azurerm_public_ip" "pip_data" {
  name                = var.pip_name
  resource_group_name = var.rg_name
}
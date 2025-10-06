resource "azurerm_lb" "lb3" {
  name                = var.lb_name
  location            = var.lb_location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration     #"PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip_data.id
  }
}
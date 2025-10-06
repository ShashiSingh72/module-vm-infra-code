data "azurerm_network_interface" "nic_data" {
  name = var.nic_name
  resource_group_name = var.rg_name
}
data "azurerm_network_security_group" "nsg_data" {
  name = var.nsg_name
  resource_group_name = var.rg_name
}
data "azurerm_lb" "lb_data" {
  name                = var.lb_name
  resource_group_name = var.rg_name
}

data "azurerm_lb_backend_address_pool" "pool_data" {
  name            = var.backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.lb_data.id
}
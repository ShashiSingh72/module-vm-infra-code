resource "azurerm_network_interface_security_group_association" "nic-nsg-asso" {
  network_interface_id      = data.azurerm_network_interface.nic_data.id
  network_security_group_id = data.azurerm_network_security_group.nsg_data.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic-pool-asso" {
  network_interface_id    = data.azurerm_network_interface.nic_data.id
  ip_configuration_name   = var.ip_config_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.pool_data.id
}
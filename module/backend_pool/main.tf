resource "azurerm_lb_backend_address_pool" "lb_pool3" {
  loadbalancer_id = data.azurerm_lb.lb_data.id
  name            = var.lbpool_name
}
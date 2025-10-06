resource "azurerm_lb_probe" "probe3" {
  loadbalancer_id = data.azurerm_lb.lb_data.id
  name            = var.lbprobe_name
  port            = 22
}
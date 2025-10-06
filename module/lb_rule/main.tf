resource "azurerm_lb_rule" "lbrule3" {
  loadbalancer_id                = data.azurerm_lb.lb_data.id
  name                           = var.lbrule_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.frontend_ip_configuration_name     #"PublicIPAddress"
}
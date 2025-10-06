data "azurerm_lb" "lb_data" {
  name                = var.lb_name
  resource_group_name = var.rg_name
}

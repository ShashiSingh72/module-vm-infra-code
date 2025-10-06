module "rg" {
  source      = "../../module/resource_group"
  rg_name     = "rg03"
  rg_location = "eastus"
}

module "vnet" {
  depends_on    = [module.rg]
  source        = "../../module/vnet"
  vnet_name     = "vnet03"
  vnet_location = "eastus"
  rg_name       = "rg03"
  address_space = ["10.0.0.0/16"]
}
module "subnet" {
  depends_on       = [module.rg, module.vnet]
  source           = "../../module/subnet"
  subnet_name      = "subnet03"
  rg_name          = "rg03"
  vnet_name        = "vnet03"
  address_prefixes = ["10.0.1.0/24"]
}
module "pip" {
  depends_on        = [module.rg, module.subnet, module.vnet]
  source            = "../../module/public_ip"
  pip_name          = "pip03"
  pip_location      = "eastus"
  rg_name           = "rg03"
  allocation_method = "Static"
}
module "nic" {
  depends_on                    = [module.pip, module.rg, module.subnet, module.vnet]
  source                        = "../../module/network_interface"
  nic_name                      = "nic03"
  nic_location                  = "eastus"
  rg_name                       = "rg03"
  ip_config_name                = "ipconfig"
  private_ip_address_allocation = "Dynamic"
  subnet_name                   = "subnet03"
  vnet_name                     = "vnet03"
}
module "nsg" {
  depends_on   = [module.nic, module.rg]
  source       = "../../module/network_security_group"
  nsg_name     = "nsg03"
  nsg_location = "eastus"
  rg_name      = "rg03"
}
module "nicasso" {
  depends_on                = [module.nic, module.nsg, module.pip, module.lbpool, module.lb, module.rg]
  source                    = "../../module/nic_association"
  nic_name                  = "nic03"
  nsg_name                  = "nsg03"
  rg_name                   = "rg03"
  lb_name                   = "lb03"
  ip_config_name            = "ipconfig"
  backend_address_pool_name = "lbpool03"
}
module "lb" {
  depends_on                = [module.rg, module.pip]
  source                    = "../../module/load_balancer"
  lb_name                   = "lb03"
  lb_location               = "eastus"
  rg_name                   = "rg03"
  pip_name                  = "pip03"
  frontend_ip_configuration = "PublicIPAddress"
}
module "lbpool" {
  depends_on  = [module.lb, module.rg]
  source      = "../../module/backend_pool"
  lbpool_name = "lbpool03"
  lb_name     = "lb03"
  rg_name     = "rg03"
}
module "lbprobe" {
  depends_on   = [module.lb, module.rg]
  source       = "../../module/health_probe"
  lbprobe_name = "lbprobe03"
  lb_name      = "lb03"
  rg_name      = "rg03"
}
module "lbrule" {
  depends_on                     = [module.lb, module.rg]
  source                         = "../../module/lb_rule"
  lbrule_name                    = "lbrule03"
  lb_name                        = "lb03"
  rg_name                        = "rg03"
  frontend_ip_configuration_name = "PublicIPAddress"
}
module "vm" {
  depends_on     = [module.lb, module.rg, module.nic]
  source         = "../../module/virtual_machine"
  vm_name        = "vm03"
  vm_location    = "eastus"
  rg_name        = "rg03"
  vm_size        = "Standard_F2"
  admin_username = "adminuser"
  admin_password = "passwor@123"
  nic_name       = "nic03"
}
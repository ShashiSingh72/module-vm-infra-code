resource "azurerm_linux_virtual_machine" "vm3" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.vm_location
  size                = var.vm_size      #"Standard_F2"
  admin_username      = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = [
    data.azurerm_network_interface.nic_data.id,
  ]
disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

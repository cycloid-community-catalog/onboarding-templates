# Create compute VM
resource "azurerm_linux_virtual_machine" "compute" {
  name                  = "${var.customer}-${var.project}-${var.env}"
  computer_name         = "${var.customer}-${var.project}-${var.env}"
  resource_group_name   = data.azurerm_resource_group.compute.name
  location              = var.azure_location
  network_interface_ids = [azurerm_network_interface.compute.id]
  size                  = var.vm_instance_type
  admin_username        = var.vm_os_user
  admin_password        = "Ch4ng3M3!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.vm_disk_size
  }

  source_image_reference {
      publisher = "Debian"
      offer     = "debian-11"
      sku       = "11"
      version   = "latest"
  }

  disable_password_authentication = false
  
  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}"
    role = "compute"
  })
}
resource "azurerm_linux_virtual_machine" "compute" {
  name                  = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  computer_name         = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  resource_group_name   = azurerm_resource_group.compute.name
  location              = var.azure_location
  network_interface_ids = [azurerm_network_interface.compute.id]
  size                  = var.vm_instance_type
  admin_username        = var.vm_os_user

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.vm_disk_size
  }

  source_image_reference {
      publisher = "Debian"
      offer     = "debian-12"
      sku       = "12"
      version   = "latest"
  }

  disable_password_authentication = true

  admin_ssh_key {
      username   = var.vm_os_user
      public_key = tls_private_key.ssh_key.public_key_openssh
  }

  tags = {
    Name = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
    role = "compute"
  }
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
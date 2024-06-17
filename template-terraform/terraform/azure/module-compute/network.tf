data "azurerm_virtual_network" "selected" {
  name                = var.vpc_name
  resource_group_name = data.azurerm_resource_group.compute.name
}

data "azurerm_subnet" "selected" {
  name                 = data.azurerm_virtual_network.selected.subnets[0]
  virtual_network_name = data.azurerm_virtual_network.selected.name
  resource_group_name  = data.azurerm_resource_group.compute.name
}

# Create Network Security Group
resource "azurerm_network_security_group" "compute" {
  name                = "${var.customer}-${var.project}-${var.env}"
  resource_group_name = data.azurerm_resource_group.compute.name
  location            = var.azure_location

  security_rule {
    name                       = "inbound-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "inbound-http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}"
  })
}

# Get a Static Public IP
resource "azurerm_public_ip" "compute" {
  name                = "${var.customer}-${var.project}-${var.env}"
  resource_group_name = data.azurerm_resource_group.compute.name
  location            = var.azure_location
  allocation_method   = "Dynamic"

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}"
  })
}

# Create Network Card for the VM
resource "azurerm_network_interface" "compute" {
  name                = "${var.customer}-${var.project}-${var.env}"
  resource_group_name = data.azurerm_resource_group.compute.name
  location            = var.azure_location

  ip_configuration {
      name                          = "${var.customer}-${var.project}-${var.env}"
      subnet_id                     = data.azurerm_subnet.selected.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.compute.id
  }

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}"
  })
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "compute" {
    network_interface_id      = azurerm_network_interface.compute.id
    network_security_group_id = azurerm_network_security_group.compute.id
}
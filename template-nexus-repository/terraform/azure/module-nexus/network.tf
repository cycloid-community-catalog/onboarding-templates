# Create Network Security Group
resource "azurerm_network_security_group" "nexus" {
  name                = "${var.customer}-${var.project}-${var.env}-nexus"
  resource_group_name = data.azurerm_resource_group.nexus.name
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
    name                       = "inbound-nexus"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.nexus_port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-nexus"
  })
}

# Get a Static Public IP
resource "azurerm_public_ip" "nexus" {
  name                = "${var.customer}-${var.project}-${var.env}-nexus"
  resource_group_name = data.azurerm_resource_group.nexus.name
  location            = var.azure_location
  allocation_method   = "Dynamic"

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-nexus"
  })
}

# Create Network Card for the VM
resource "azurerm_network_interface" "nexus" {
  name                = "${var.customer}-${var.project}-${var.env}-nexus"
  resource_group_name = data.azurerm_resource_group.nexus.name
  location            = var.azure_location

  ip_configuration {
      name                          = "${var.customer}-${var.project}-${var.env}-nexus"
      subnet_id                     = azurerm_subnet.nexus.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.nexus.id
  }

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-nexus"
  })
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nexus" {
    network_interface_id      = azurerm_network_interface.nexus.id
    network_security_group_id = azurerm_network_security_group.nexus.id
}

resource "azurerm_virtual_network" "nexus" {
  name                = "${var.customer}-${var.project}-${var.env}-nexus"
  resource_group_name = data.azurerm_resource_group.nexus.name
  location            = var.azure_location
  address_space       = ["10.123.0.0/16"]

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-nexus"
  })
}

resource "azurerm_subnet" "nexus" {
  name                 = "${var.customer}-${var.project}-${var.env}-nexus"
  virtual_network_name = azurerm_virtual_network.nexus.name
  resource_group_name  = data.azurerm_resource_group.nexus.name

  address_prefixes     = ["10.123.1.0/24"]
}
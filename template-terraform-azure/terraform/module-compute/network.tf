resource "azurerm_virtual_network" "compute" {
  name                = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  resource_group_name = azurerm_resource_group.compute.name
  location            = var.azure_location
  address_space       = ["10.77.0.0/16"]
}

resource "azurerm_subnet" "compute" {
  name                 = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  resource_group_name = azurerm_resource_group.compute.name
  virtual_network_name = azurerm_virtual_network.compute.name
  address_prefixes     = ["10.77.1.0/24"]
}

resource "azurerm_network_security_group" "compute" {
  name                = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  resource_group_name = azurerm_resource_group.compute.name
  location            = var.azure_location

  tags = {
    Name = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
    role = "security_group"
  }
}

resource "azurerm_network_security_rule" "inbound" {
  resource_group_name         = azurerm_resource_group.compute.name
  network_security_group_name = azurerm_network_security_group.compute.name

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

# Get a Static Public IP
resource "azurerm_public_ip" "compute" {
  name                = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  resource_group_name = azurerm_resource_group.compute.name
  location            = var.azure_location
  allocation_method   = "Dynamic"

  tags = {
    Name = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
    role = "public_ip"
  }
}

# Create Network Card for the VM
resource "azurerm_network_interface" "compute" {
  name                = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  resource_group_name = azurerm_resource_group.compute.name
  location            = var.azure_location

  ip_configuration {
      name                          = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
      subnet_id                     = azurerm_subnet.compute.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.compute.id
  }

  tags = {
    Name = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
    role = "network_interface"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "compute" {
    network_interface_id      = azurerm_network_interface.compute.id
    network_security_group_id = azurerm_network_security_group.compute.id
}
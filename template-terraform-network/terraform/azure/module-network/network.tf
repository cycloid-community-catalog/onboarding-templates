resource "azurerm_virtual_network" "infra" {
  name                = "${var.customer}-${var.project}-${var.env}-infra"
  resource_group_name = azurerm_resource_group.infra.name
  location            = var.azure_location
  address_space       = [var.network_cidr]

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-infra"
  })
}

resource "azurerm_subnet" "infra" {
  name                 = "${var.customer}-${var.project}-${var.env}-infra"
  virtual_network_name = azurerm_virtual_network.infra.name
  resource_group_name  = azurerm_resource_group.infra.name

  address_prefixes     = [var.subnet_cidr]
}
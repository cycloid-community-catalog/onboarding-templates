resource "azurerm_resource_group" "compute" {
  name     = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  location = var.azure_location
}
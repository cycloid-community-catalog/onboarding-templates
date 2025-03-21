resource "azurerm_resource_group" "compute" {
  name     = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  location = var.azure_location
}
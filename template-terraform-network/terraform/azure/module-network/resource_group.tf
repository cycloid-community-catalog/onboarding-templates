resource "azurerm_resource_group" "infra" {
  name     = var.rg_name
  location = var.azure_location
}
# Existing vnet
data "azurerm_virtual_network" "aks" {
  name                = var.azurerm_virtual_network_name
  resource_group_name = var.azurerm_virtual_network_rg
}

# Existing subnet
data "azurerm_subnet" "aks" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = var.azurerm_virtual_network_name
  resource_group_name  = var.azurerm_virtual_network_rg
}
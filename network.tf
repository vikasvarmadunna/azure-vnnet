resource "azurerm_virtual_network" "ntier_vnet" {
  name                = var.vnet_details.name
  location            = var.resourcegroup_details.location
  resource_group_name = var.resourcegroup_details.name
  address_space       = var.vnet_details.address_space
  depends_on = [
    azurerm_resource_group.ntier
  ]
  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "ntiersubnets" {
  count                = length(var.subnet_details.names)
  name                 = var.subnet_details.names[count.index]
  virtual_network_name = var.vnet_details.name
  address_prefixes     = [cidrsubnet(var.vnet_details.address_space[0], 8, count.index)]
  resource_group_name  = var.resourcegroup_details.name

  depends_on = [
    azurerm_resource_group.ntier,
    azurerm_virtual_network.ntier_vnet
  ]


}
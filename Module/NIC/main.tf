data "azurerm_subnet" "subnetdata" {
  for_each             = var.nics
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}


data "azurerm_public_ip" "publicdatacode" {
    for_each           = var.nics
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface" "niccode" {
  for_each            = var.nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetdata[each.key].id
    public_ip_address_id = data.azurerm_public_ip.publicdatacode[each.key].id
    
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_network_interface" "datanic" {
    for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "keyvault_data" {
    for_each = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "secret_sauce" {
    for_each = var.vms
    name         = each.value.secret_name 
    key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id

}

resource "azurerm_linux_virtual_machine" "vmcode" {
    for_each = var.vms

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  
  admin_password = data.azurerm_key_vault_secret.secret_sauce[each.key].value
  disable_password_authentication = "false" 
  network_interface_ids = [
    data.azurerm_network_interface.datanic[each.key].id
  ]

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
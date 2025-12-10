
data "azurerm_key_vault" "keyvault_data" {
    for_each = var.secrets
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}




resource "azurerm_key_vault_secret" "secret_sauce" {
    for_each = var.secrets

  name         = each.value.secret_name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}
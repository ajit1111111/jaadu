variable "keyvaults" {
    description = "A map of Key Vault configurations"
    type = map(object({
        key_vault_name      = string
        location            = string
        resource_group_name = string
        sku_name            = optional(string)
        enabled_for_disk_encryption = optional(bool)
        soft_delete_retention_days  = optional(number)
        purge_protection_enabled    = optional(bool)
    }))
}

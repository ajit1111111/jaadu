variable "secrets" {
  description = "A map of secrets to be created in the Key Vault."
  type = map(object({
    secret_name      = string
    key_vault_name = string
    resource_group_name = string
    value        = string
    
  }))
}   
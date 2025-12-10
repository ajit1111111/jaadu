variable "pvrgs"{
    type = map(object({
        resource_group_name = string
        location            = string
    }))

}
variable "pvvnets" {
    type = map(object({
        vnet_name          = string
        address_space      = list(string)
        resource_group_name = string
        location           = string
        subnets            = map(object({
            name           = string
            address_prefix = list(string)
        }))
    }))
}
variable "pvpips" {
    description = "A map of public IP configurations"
    type = map(object({
        pip_name             = string
        resource_group_name  = string
        location             = string
    }))
  
}
variable "pvnics" {
    description = "A map of NIC configurations"
    type = map(object({
        nic_name             = string
        location             = string
        resource_group_name  = string
        subnet_name          = string
        vnet_name            = string
        public_ip_name      = string
        ip_configuration = object({
            name                        = string
            private_ip_address_allocation = string
        })
    }))
    }
  variable "pvvms" {
    description = "A map of VM configurations"
    type = map(object({
        key_vault_name = string
        secret_name = string
        nic_name            = string
        vm_name              = string
        location             = string
        resource_group_name  = string
        
        vm_size              = string
        admin_username       = string
    
        
}))
    
}
variable "pvkeyvaults" {
  
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
variable "pvsecrets" {
    description = "A map of secrets to be created in the Key Vault."
    type = map(object({
        secret_name        = string
        key_vault_name = string
        resource_group_name = string
        value        = string
    
    }))
}
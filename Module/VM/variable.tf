variable "vms" {
    description = "A map of VM configurations"
    type = map(object({
        key_vault_name = string
        secret_name = string
        nic_name            = string    
        vm_name              = string
        location             = string
        resource_group_name  = string
    
        admin_username       = string
        
        vm_size              = string
    
    
        
}))
    
}
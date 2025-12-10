variable "vnets" {
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
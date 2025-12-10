variable "pips" {
    description = "A map of public IP configurations"
    type = map(object({
        pip_name             = string
        resource_group_name  = string
        location             = string
    }))
  
}
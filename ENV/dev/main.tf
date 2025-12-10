module "rg_module" {
  source = "../../Module/Resource_group"
  rgs    = var.pvrgs
}

module "vnet_subnet_module" {
  source     = "../../Module/vnet_subnet"
  vnets      = var.pvvnets
  depends_on = [module.rg_module]
}

module "pip_module" {
  source     = "../../Module/PIP"
  pips       = var.pvpips
  depends_on = [module.rg_module]
}

module "nic_module" {
  source     = "../../Module/NIC"
  nics       = var.pvnics
  depends_on = [
    module.rg_module,
    module.vnet_subnet_module,
    module.pip_module
  ]
}
module "key_vault_module" {
  source      = "../../Module/key_vault"
  keyvaults  = var.pvkeyvaults
  depends_on = [module.rg_module]
}

module "secret_module" {
  source     = "../../Module/secret"
  secrets    = var.pvsecrets
  depends_on = [
    module.key_vault_module,

  ]
}


module "vm_module" {
  source     = "../../Module/VM"
  vms        = var.pvvms
  depends_on = [
    module.rg_module,
    module.nic_module,module.key_vault_module,module.secret_module
  ]
}


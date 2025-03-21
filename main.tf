module "network" {
  source = "./network"
  location = var.location
  resource_group_name = var.resource_group_name
}

module "compute" {
  source              = "./compute"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.vm_subnet_id

  admin_username      = var.admin_username       # ← add this
  admin_password      = var.admin_password       # ← add this  
}

module "storage" {
  source              = "./storage"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "monitoring" {
  source              = "./monitoring"
  location            = var.location
  resource_group_name = module.network.resource_group_name

  jumpbox_vm_id       = module.compute.jumpbox_vm_id
  windows_vm_ids      = module.compute.windows_vm_ids
  redhat_vm_ids       = module.compute.redhat_vm_ids

  windows_vm_count    = 3
  redhat_vm_count     = 2
}




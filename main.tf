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
}

module "storage" {
  source              = "./storage"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "monitoring" {
  source              = "./monitoring"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_ids              = module.compute.vm_ids
}

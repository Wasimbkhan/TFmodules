module "Vm" {
  source      = "./Module/VM"
  VM_name     = "VM-one"
  rg_name     = "rg-one"
  vnet_name   = "vm-vnet"
  subnet_name = "subnet-one"
  location    = "West Europe"
  size        = "Standard_F2"
}
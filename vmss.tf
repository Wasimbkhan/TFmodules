module "VMSS" {
  source = "./Module/VMSS"
  VMSS_name = "vmss-one"
  rg_name = "rg-one"
  location = "West Europe"
  vnet_name = "wasimnetwork"
  subnet = "subnet-one"
  pubkey = file("~/.ssh/khan.pub")
  size = "Standard_F2"
}
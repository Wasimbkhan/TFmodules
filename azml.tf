module "azml" {
  source         = "./Module/azml"
  rg_name        = "azml_rg"
  azml-vnet      = "azml-vnet"
  azml-subnet    = "azml-subnet"
  azml-insights  = "azml-insights"
  azml-kv        = "azml-kv"
  azml-stg       = "azmlstgtest"
  azml-cc        = "azml-cluster1"
  azml-workspace = "azml-workspace"
  minnodecount   = 0
  maxnodecount   = 1

}
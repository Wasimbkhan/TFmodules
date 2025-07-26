variable "rg_name" {
  description = "Resource group name"
  type = string
}

variable "azml-insights" {
  description = "azml insights name"
  type = string
}

variable "azml-kv" {
  description = " azml key valut name"
  type = string
}

variable "azml-stg" {
  description = "azml storage account name"
  type = string
}

variable "azml-workspace" {
  description = "azml workspace name"
  type = string
}

variable "azml-vnet" {
  description = "azml vnet name"
  type = string
}

variable "azml-subnet" {
  description = "azml subnet name"
  type = string
}

variable "azml-cc" {
  description = "azml compute cluster name"
  type = string
}

variable "azml-ccvmsize" {
  description = "azml compute cluster name"
  default = "Standard_DS2_v2"
}

variable "minnodecount" {
  description = "compute cluster minimum node count"
  type = number
}

variable "maxnodecount" {
  description = "compute cluster maximum node count"
  type = number
}



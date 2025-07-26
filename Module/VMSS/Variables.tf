variable "VMSS_name" {
  description = "Virtual machine name"
  type        = string             # or number, bool, list, map, etc.
    # optional
}

variable "rg_name" {
  description = "resource group name"
  type        = string             # or number, bool, list, map, etc.
    # optional
}

variable "location" {
  description = "location name"
  type        = string             # or number, bool, list, map, etc.
    # optional
}

variable "vnet_name" {
  description = "vnet name"
  type        = string             # or number, bool, list, map, etc.
  # optional
}

variable "subnet" {
  description = "subnet name"
  type        = string             # or number, bool, list, map, etc.
    # optional
}

variable "size" {
  description = "Virtual machine size"
  type        = string             # or number, bool, list, map, etc.
    # optional
}

variable "pubkey" {
  description = "ssh public key"
  type        = string             # or number, bool, list, map, etc.
    # optional
}

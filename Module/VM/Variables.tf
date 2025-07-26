variable "VM_name" {
  description = "Virtual machine name"
  type        = string             # or number, bool, list, map, etc.
    # optional
}

variable "rg_name" {
  description = "Resource group name"
  type        = string             # or number, bool, list, map, etc.
  # optional
}

variable "vnet_name" {
  description = "virtual network name"
  type        = string             # or number, bool, list, map, etc.
  # optional
}

variable "subnet_name" {
  description = "subnet name"
  type        = string             # or number, bool, list, map, etc.
   # optional
}

variable "location" {
  description = "location name"
  type        = string             # or number, bool, list, map, etc.
   # optional
}

variable "size" {
  description = "Virtual machine size"
  type        = string             # or number, bool, list, map, etc.
   # optional
}

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
  description = "Resource group name"
  type        = string             # or number, bool, list, map, etc.
  # optional
}

variable "subnet_name" {
  description = "Resource group name"
  type        = string             # or number, bool, list, map, etc.
   # optional
}

variable "location" {
  description = "Resource group location"
  type        = string             # or number, bool, list, map, etc.
   # optional
}

variable "size" {
  description = "Resource group location"
  type        = string             # or number, bool, list, map, etc.
   # optional
}

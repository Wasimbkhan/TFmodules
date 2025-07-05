variable "VM_name" {
  description = "Virtual machine name"
  type        = string             # or number, bool, list, map, etc.
  default     = "Vm-one"    # optional
}

variable "rg_name" {
  description = "Resource group name"
  type        = string             # or number, bool, list, map, etc.
  default     = "rg-one"    # optional
}

variable "subnet_name" {
  description = "Resource group name"
  type        = string             # or number, bool, list, map, etc.
  default     = "subnet-1"    # optional
}
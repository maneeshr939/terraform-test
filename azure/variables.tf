variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-tf-demo"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-tf-demo"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet-vm"
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "vm-tf-demo"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Linux VM admin username"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Linux VM admin password"
  type        = string
}


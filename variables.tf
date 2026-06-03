variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "vm_size" {}
variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}
variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
}
variable "create_public_ip" {
  description = "Whether to create a public IP address for the virtual machine."
  type        = bool
  default     = false
}
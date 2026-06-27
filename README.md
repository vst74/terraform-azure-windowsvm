# Azure Virtual Machine Terraform Module

## Overview
This Terraform module provisions an Azure Virtual Machine along with the required supporting resources such as network interface, public IP (optional), and managed disks.

## Features
- Create Azure Virtual Machine (Linux/Windows)
- Network Interface configuration
- Public IP (optional)
- OS Disk and Data Disks
- NSG association support
- Custom tags support

## Prerequisites
- Terraform >= 1.0
- Azure CLI authenticated (`az login`)
- Appropriate Azure subscription permissions

## Usage

```hcl
module "azure_vm" {
  source = "./modules/azure-vm"

  resource_group_name = "rg-demo"
  location            = "East US"
  vm_name             = "demo-vm"
  vm_size             = "Standard_B2s"

  admin_username      = "azureuser"
  admin_password      = "Password1234!"

  subnet_id           = "/subscriptions/xxx/resourceGroups/rg-demo/providers/Microsoft.Network/virtualNetworks/vnet/subnets/default"

  create_public_ip    = true

  tags = {
    environment = "dev"
  }
}
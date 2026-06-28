# Basic Example – Azure Windows VM Module

This example provisions a Windows Virtual Machine using the `vst74/windowsvm/azure` Terraform module.

## Usage

```hcl
module "windows_vm" {
  source  = "vst74/windowsvm/azure"
  version = "1.0.6"

  location            = "East US"
  resource_group_name = "rg-demo"
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  create_public_ip    = true
}
```

## Steps

```bash
terraform init
terraform plan
terraform apply
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| location | Azure region | `string` | n/a | yes |
| resource_group_name | Resource group name | `string` | n/a | yes |
| vm_size | VM SKU size | `string` | n/a | yes |
| admin_username | Admin username | `string` | n/a | yes |
| admin_password | Admin password | `string` | n/a | yes |
| create_public_ip | Create public IP | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | The resource ID of the VM |
| private_ip | Private IP address |
| public_ip | Public IP address (if enabled) |

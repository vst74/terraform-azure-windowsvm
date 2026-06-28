module "windows_vm" {
  source  = "vst74/windowsvm/azure"
  version = "1.0.5"

  location            = "East US"
  resource_group_name = "rg-demo"
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  create_public_ip    = true
}

output "vm_id" {
  value = module.windows_vm.vm_id
}

output "private_ip" {
  value = module.windows_vm.private_ip
}

output "public_ip" {
  value = module.windows_vm.public_ip
}

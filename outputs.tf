
output "vm_id" {
  value = azurerm_virtual_machine.azure_windows_vm.id
}

output "private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "public_ip" {
  value = var.create_public_ip ? azurerm_public_ip.azure_windows_pip[0].ip_address : null
}
    
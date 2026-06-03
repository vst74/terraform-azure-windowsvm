
data "azurerm_virtual_network" "poc_vnet" {
  name                = "poc-vnet"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "poc_subnet" {
  name                 = "poc-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.poc_vnet.name
}

##### Network Interface
resource "azurerm_network_interface" "azure_windows_vm_nic" {
  name                = "${local.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${local.vm_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.poc_subnet.id
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.create_public_ip ? azurerm_public_ip.azure_windows_pip[0].id : null
  }
  tags = local.tags
}

resource "azurerm_virtual_machine" "azure_windows_vm" {
  name                  = local.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.azure_windows_vm_nic.id]
  vm_size               = var.vm_size


  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_os_disk {
    name              = "${local.vm_name}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }

  os_profile {
    computer_name  = local.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  tags = local.tags
  depends_on = [azurerm_network_interface.azure_windows_vm_nic]
  lifecycle {
    ignore_changes = [os_profile]
    }
}
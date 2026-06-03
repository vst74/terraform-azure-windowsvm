resource "azurerm_public_ip" "azure_windows_pip" {
  count               = var.create_public_ip ? 1 : 0
  name                = "${local.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags                = local.tags
}
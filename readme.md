
## Example Usage

module "vm" {
  source = "app/azurerm/vm"

  vm_name  = "testvm"
  location = "eastus"
}

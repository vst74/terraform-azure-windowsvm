locals {
  env     = "poc"
  os      = "windows"
  vm_name = "${local.env}-${local.os}"
}

locals {
  tags = {
    environment = "poc"
    app_name    = "myapp"
    cost_center = "IT"
  }
}
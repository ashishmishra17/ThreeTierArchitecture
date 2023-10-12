resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = "production"
  }
}

resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "B1"
  os_type             = "Linux"
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = var.azurevm_name
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_D2s_v3"
  admin_username                  = "adminuser"
  admin_password                  = "*******"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]
}

resource "azurerm_virtual_network" "main" {
  name                = var.azurevn_name
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_interface" "main" {
  name                = var.azure_nic_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

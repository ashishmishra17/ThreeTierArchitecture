variable "resource_group_name" {
  type        = string
  description = "RG_Azure"
}

variable "resource_group_location" {
  type        = string
  description = "eastus"
}

variable "app_service_plan_name" {
  type        = string
  description = "api-appserviceplan-pro"
}

variable "azurevm_name" {
  type        = string
  description = "azurerm_linux_virtual_machine"
}

variable "azurevn_name" {
  type        = string
  description = "azurerm_virtual_network"
}

variable "azure_nic_name" {
  type        = string
  description = "azurerm_network_interface"
}


output "resource_group_name" {
  description = "Name of the Azure Resource Group"
  value       = azurerm_resource_group.main.name
}

output "virtual_network_id" {
  description = "Resource ID of the Azure Virtual Network"
  value       = azurerm_virtual_network.main.id
}
output "resource_group_name" {
  value = azurerm_resource_group.demo.name
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.demo.name
}

output "public_ip_address" {
  value = azurerm_public_ip.vm.ip_address
}


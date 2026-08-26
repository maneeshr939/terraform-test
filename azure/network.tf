resource "azurerm_virtual_network" "demo" {
  name                = var.vnet_name
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "demo"
    managed_by  = "terraform"
  }
}

resource "azurerm_subnet" "vm" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "vm" {
  name                = "nsg-vm-demo"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "demo"
    managed_by  = "terraform"
  }
}

resource "azurerm_public_ip" "vm" {
  name                = "pip-vm-demo"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = {
    environment = "demo"
    managed_by  = "terraform"
  }
}

resource "azurerm_network_interface" "vm" {
  name                = "nic-vm-demo"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }

  tags = {
    environment = "demo"
    managed_by  = "terraform"
  }
}


resource "azurerm_network_interface_security_group_association" "vm" {
  network_interface_id      = azurerm_network_interface.vm.id
  network_security_group_id = azurerm_network_security_group.vm.id
}

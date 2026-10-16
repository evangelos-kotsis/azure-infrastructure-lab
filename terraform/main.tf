resource "azurerm_resource_group" "main" {
  name     = "rg-azure-infrastructure-lab"
  location = var.location

  tags = {
    environment = "lab"
    project     = "azure-infrastructure-lab"
    managed_by  = "terraform"
  }
}
resource "azurerm_virtual_network" "main" {
  name                = "vnet-azure-infrastructure-lab"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    environment = "lab"
    project     = "azure-infrastructure-lab"
    managed_by  = "terraform"
  }
}
resource "azurerm_subnet" "app" {
  name                 = "snet-app"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.10.1.0/24"]
}
resource "azurerm_network_security_group" "app" {
  name                = "nsg-app"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    environment = "lab"
    project     = "azure-infrastructure-lab"
    managed_by  = "terraform"
  }
}
resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}
resource "azurerm_network_security_rule" "allow_https_corporate" {
  name                        = "Allow-HTTPS-Corporate"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "203.0.113.0/24"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.app.name
}
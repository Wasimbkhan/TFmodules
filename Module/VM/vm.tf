resource "azurerm_resource_group" "rgone" {
  name     = var.rg_name
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnetone" {
  name                = "wasimnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rgone.location
  resource_group_name = azurerm_resource_group.rgone.name
}

resource "azurerm_subnet" "subnetone" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rgone.name
  virtual_network_name = azurerm_virtual_network.vnetone.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nicone" {
  name                = "${var.VM_name}-nic"
  location            = azurerm_resource_group.rgone.location
  resource_group_name = azurerm_resource_group.rgone.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetone
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_linux_virtual_machine" "vmone" {
  name                = var.VM_name
  resource_group_name = azurerm_resource_group.rgone.name
  location            = azurerm_resource_group.rgone.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nicone,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/khan.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
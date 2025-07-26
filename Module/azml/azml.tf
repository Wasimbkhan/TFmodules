data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "azml-rg" {
  name = var.rg_name
  location = "eastus"
}


resource "azurerm_application_insights" "azml-insights" {
  name                = var.azml-insights
  location            = azurerm_resource_group.azml-rg.location
  resource_group_name = azurerm_resource_group.azml-rg.name
  application_type    = "web"
}

resource "azurerm_key_vault" "azml-kv" {
  name                = var.azml-kv
  location            = azurerm_resource_group.azml-rg.location
  resource_group_name = azurerm_resource_group.azml-rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  purge_protection_enabled = true
}

resource "azurerm_storage_account" "azml-stg" {
  name                     = var.azml-stg
  location                 = azurerm_resource_group.azml-rg.location
  resource_group_name      = azurerm_resource_group.azml-rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_machine_learning_workspace" "azml-workspace" {
  name                    = var.azml-workspace
  location                = azurerm_resource_group.azml-rg.location
  resource_group_name     = azurerm_resource_group.azml-rg.name
  application_insights_id = azurerm_application_insights.azml-insights.id
  key_vault_id            = azurerm_key_vault.azml-kv.id
  storage_account_id      = azurerm_storage_account.azml-stg.id

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_virtual_network" "azml-vnet" {
  name                = var.azml-vnet
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.azml-rg.location
  resource_group_name = azurerm_resource_group.azml-rg.name
}

resource "azurerm_subnet" "azml-subnet" {
  name                 = var.azml-subnet
  resource_group_name  = azurerm_resource_group.azml-rg.name
  virtual_network_name = azurerm_virtual_network.azml-vnet.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_machine_learning_compute_cluster" "azml-cc" {
  depends_on = [ azurerm_machine_learning_workspace.azml-workspace ]
  name                          = var.azml-cc
  location                      = azurerm_resource_group.azml-rg.location
  vm_priority                   = "LowPriority"
  vm_size                       = var.azml-ccvmsize
  machine_learning_workspace_id = azurerm_machine_learning_workspace.azml-workspace.id
  subnet_resource_id            = azurerm_subnet.azml-subnet.id

  scale_settings {
    min_node_count                       = var.minnodecount
    max_node_count                       = var.maxnodecount
    scale_down_nodes_after_idle_duration = "PT30S" # 30 seconds
  }

  identity {
    type = "SystemAssigned"
  }
}
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatebackendstg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

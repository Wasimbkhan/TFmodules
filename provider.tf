terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "51f12368-372d-48c6-8e3c-02c940c4a791"
}
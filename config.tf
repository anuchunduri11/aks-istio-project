terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  required_version = ">=0.13.0"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "anu-chunduri"
    storage_account_name = "anuchunduridevopssa"
    container_name       = "tfstate"
    key                  = "aks-istio.tfstate"
  }
}

provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"

    }
  }
}
provider "azurerm" {
  features {

  }
  subscription_id = "30c669d0-afb4-45f6-a261-dd314a10bf69"
}
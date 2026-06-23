# Provides configuration details for Terraform
terraform {
  required_providers {
    # This means we can find azurerm provider in the Terraform Registry
    azurerm = {
      source = "hashicorp/azurerm"
      # and I want to use at least version 4.0 or higher 
      version = "~>4.0"
    }
  }
}

# Now we have to give more details more about the provider.
provider "azurerm" {
  features {}
}

# Provides the resource group to logically contain resources
# "azurerm_resource_group" is the resource type, and "rg" is the name of the resource.
# azurerm_resource_group.rg is the resource reference within terraform.
resource "azurerm_resource_group" "rg" {
  # This is the actual resource group name created in Azure
  name     = "rg-terraform"
  location = "East US"
  tags = {
    environment = "dev"
    source      = "terraform"
    owner       = "Steven"
  }
}
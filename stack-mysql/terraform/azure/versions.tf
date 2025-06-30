terraform {
  required_version = ">= 1.0"
  required_providers {
    cycloid = {
      source = "cycloidio/cycloid"
      version = ">= 0.0.21"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
} 
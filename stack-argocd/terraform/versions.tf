terraform {
  required_version = ">= 1.0"
  
  required_providers {
    helm = {
      version = ">= 2.17.0"
    }
    cycloid = {
      source = "cycloidio/cycloid"
      version = ">= 0.0.20"
    }
  }
}
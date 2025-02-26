terraform {
  required_version = ">= 1.0"
  
  required_providers {
    helm = {
      version = ">= 2.3.0"
    }
    cycloid = {
      source = "cycloidio/cycloid"
      version = ">= 0.0.20"
    }
  }
}

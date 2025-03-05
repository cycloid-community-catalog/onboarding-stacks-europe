terraform {
  required_version = ">= 1.0"
  
  required_providers {
    cycloid = {
      source = "cycloidio/cycloid"
      version = ">= 0.0.19"
    }
    google = {
      source = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
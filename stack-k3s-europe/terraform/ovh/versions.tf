terraform {
  required_version = ">= 1.0"
  
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 3.0.0"
    }
    cycloid = {
      source = "cycloidio/cycloid"
      version = ">= 0.0.20"
    }
  }
}
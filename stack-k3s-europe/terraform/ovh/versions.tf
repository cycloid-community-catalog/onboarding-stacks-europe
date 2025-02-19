terraform {
  required_version = ">= 1.0"
  
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 3.0.0"
    }
    # ovh = {
    #   source  = "ovh/ovh"
    #   version = "~> 1.6"
    # }
    cycloid = {
      source = "cycloidio/cycloid"
      version = ">= 0.0.20"
    }
  }
}
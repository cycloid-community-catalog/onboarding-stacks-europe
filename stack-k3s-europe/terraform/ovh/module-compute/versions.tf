terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }
    cycloid = {
      source = "cycloidio/cycloid"
    }
  }
}
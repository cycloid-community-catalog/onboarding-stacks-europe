terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }
    ovh = {
      source  = "ovh/ovh"
    }
    cycloid = {
      source = "cycloidio/cycloid"
    }
  }
}
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.42"
    }
    ovh = {
      source  = "ovh/ovh"
      version = "~> 1.6"
    }
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
      version = "~> 6.7"
    }
  }
}
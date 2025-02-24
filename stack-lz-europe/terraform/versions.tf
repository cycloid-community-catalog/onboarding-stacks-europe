terraform {
  required_version = ">= 1.0"
  
  required_providers {
    outscale = {
      source = "outscale/outscale"
      version = ">= 1.0"
    }
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
      version = "~> 6.7"
    }
  }
}
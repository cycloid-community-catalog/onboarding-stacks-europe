provider "vsphere" {
  user           = var.vmware_cred.username
  password       = var.vmware_cred.password
  vsphere_server = var.vmware_server

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere_allow_unverified_ssl
}

provider "cycloid" {
  organization_canonical = var.cyorg
  jwt                    = var.cycloid_api_key
  url                    = var.cycloid_api_url
}
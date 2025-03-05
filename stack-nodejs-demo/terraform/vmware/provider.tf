provider "vsphere" {
  vsphere_server = var.vsphere_server
  user           = var.vsphere_cred.user
  password       = var.vsphere_cred.password

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere_allow_unverified_ssl
}

provider "cycloid" {
  organization_canonical = var.cyorg
  jwt                    = var.cyorg_jwt
  url                    = var.cycloid_api_url
}
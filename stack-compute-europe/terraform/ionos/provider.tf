provider "ionoscloud" {
  token = var.ionos_cred.token
}

provider "cycloid" {
  organization_canonical = var.cyorg
  jwt                    = var.cycloid_api_key
  url                    = var.cycloid_api_url
}
provider "outscale" {
  access_key_id   = var.outscale_cred.access_id
  secret_key_id   = var.outscale_cred.secret_id
  region          = var.outscale_region
}

provider "cycloid" {
  organization_canonical = var.cy_org
  jwt                    = var.cycloid_jwt
  url                    = var.cycloid_api_url
}
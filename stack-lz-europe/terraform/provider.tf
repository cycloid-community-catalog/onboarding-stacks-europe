provider "outscale" {
  access_key_id   = var.outscale_cred.access_key
  secret_key_id   = var.outscale_cred.secret_key
  region          = var.outscale_region
}

provider "ionoscloud" {
  token = var.ionos_cred.token
}
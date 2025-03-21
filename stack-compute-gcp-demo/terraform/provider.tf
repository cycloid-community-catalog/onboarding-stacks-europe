provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

provider "cycloid" {
  organization_canonical = var.cyorg
  jwt                    = var.cycloid_api_key
  url                    = var.cycloid_api_url
}
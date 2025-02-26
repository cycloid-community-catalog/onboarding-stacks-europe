provider "helm" {
  kubernetes {
    insecure = true
  }
}

provider "cycloid" {
  organization_canonical = var.cy_org
  jwt                    = var.cycloid_jwt
  url                    = var.cycloid_api_url
}
provider "cycloid" {
  organization_canonical = var.cy_org
  jwt                    = var.cycloid_api_key
  url                    = var.cycloid_api_url
}

provider "github" {
  token = var.github_pat
}

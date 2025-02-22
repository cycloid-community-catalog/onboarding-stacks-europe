provider "helm" {
  kubernetes {
    config_path = "${path.module}/${var.kubeconfig_filename}"
    insecure    = true
  }
}

provider "kubernetes" {
  config_path = "${path.module}/${var.kubeconfig_filename}"
  insecure    = true
}

provider "github" {
  token = var.github_pat
}

provider "cycloid" {
  organization_canonical = var.cy_org
  jwt                    = var.cycloid_jwt
  url                    = var.cycloid_api_url
}
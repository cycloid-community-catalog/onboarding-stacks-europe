# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

variable "argocd_version" {
  description = "The version of ArgoCD to deploy."
}

variable "argocd_git_url" {
  description = "The URL of the ArgoCD git repo."
}

variable "argocd_git_key" {
  description = "The private SSH key to access the ArgoCD git repo."
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  cycloid_tags = {
    cycloid_organization = var.cy_org
    cycloid_project      = var.cy_pro
    cycloid_environment  = var.cy_env
    cycloid_component    = var.cy_com
  }
  merged_tags = merge(local.cycloid_tags, var.extra_tags)
}
# Cycloid
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

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
    cycloid_organization = var.cyorg
    cycloid_project      = var.cypro
    cycloid_environment  = var.cyenv
    cycloid_component    = var.cycom
  }
  merged_tags = merge(local.cycloid_tags, var.extra_tags)
}
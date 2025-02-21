# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# Kubernetes Kubeconfig filename to use.
# This Kubeconfig file was provisionned by the pipeline before calling this Terraform module.
variable "kubeconfig_filename" {}

# GitHub
variable "github_pat" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
}

# Cycloid
variable "cycloid_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cycloid_jwt" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}

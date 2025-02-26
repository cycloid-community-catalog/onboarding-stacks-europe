# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

variable "cycloid_api_url" {
  type        = string
  default     = "https://api.us.cycloid.io/"
  description = "Cycloid API endpoint"
}

variable "cyorg_jwt" {
  type        = string
  description = "Cycloid Organization JWT used for authentication"
  sensitive   = true
}

variable "github_pat" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
}
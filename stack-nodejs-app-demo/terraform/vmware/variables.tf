# Cycloid variables
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

# vSphere variables
variable "vsphere_server" {
  description = "vSphere server"
}

variable "vsphere_cred" {
  description = "vSphere credentials"
}

variable "vsphere_allow_unverified_ssl"{
    default = true
}

variable "cy_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cy_api_key" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}
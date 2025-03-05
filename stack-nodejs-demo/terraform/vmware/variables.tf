# Cycloid variables
variable "cyenv" {}
variable "cyproject" {}
variable "cyorg" {}

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

variable "cycloid_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cyorg_jwt" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}
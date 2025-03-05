# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# VMware variables
variable "vmware_cred" {}

variable "vmware_server"{
    default = "1.1.1.1"
}

variable "vsphere_allow_unverified_ssl"{
    default = true
}

# Cycloid
variable "cycloid_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cycloid_api_key" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}
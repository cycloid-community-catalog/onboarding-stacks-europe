# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

#
# Nexus Repository
#
variable "vm_disk_size" {
  description = "Disk size for the Nexus Repository (Go)"
  default = "10"
}
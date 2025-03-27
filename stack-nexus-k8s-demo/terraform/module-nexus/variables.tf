# Cycloid
variable "cy_org" {}
variable "cy_project" {}
variable "cy_env" {}
variable "cy_component" {}

#
# Nexus Repository
#
variable "vm_disk_size" {
  description = "Disk size for the Nexus Repository (Go)"
  default = "10"
}
# Cycloid
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

variable "git_app_url" {
  description = "Public git URL of the web application to build and deploy."
}

# Infra
variable "vm_cpu" {
  description = "Number of CPU allocated to the virtual machine"
  default     = 2
}

variable "vm_memory" {
  description = "Memory allocated to the virtual machine (Mo)"
  default = 2048
}

variable "vm_disk_size" {
  description = "Disk size allocated to the virtual machine (Go)"
  default     = 20
}

variable "vsphere_template" {
  description = "Virtual machine template"
  default     = "debian"
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  standard_tags = {
    "cycloidio" = "true"
    cy_env        = var.cy_env
    cy_project    = var.cy_project
    cy_org        = var.cy_org
    demo         = true
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}
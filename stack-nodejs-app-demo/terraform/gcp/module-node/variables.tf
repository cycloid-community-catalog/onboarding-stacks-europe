# Cycloid
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

variable "git_app_url" {
  description = "Public git URL of the web application to build and deploy."
}

# Infra
variable "vm_machine_type" {
  description = "Machine type for the Nexus Repository"
  default     = "n2-standard-2"
}

variable "vm_disk_size" {
  description = "Disk size for the instance (Go)"
  default = "20"
}

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH. Set to 'admin' because we use debian OS."
  default     = "admin"
}

variable "vpc_name" {
  description = "VPC name where to deploy the instance"
}

variable "gcp_zone" {
  description = "GCP zone where to create servers."
  default     = "europe-west1-b"
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
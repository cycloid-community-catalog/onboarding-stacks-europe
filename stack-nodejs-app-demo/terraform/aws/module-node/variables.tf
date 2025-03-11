# Cycloid
variable "cyenv" {}
variable "cyproject" {}
variable "cyorg" {}

variable "git_app_url" {
  description = "Public git URL of the web application to build and deploy."
}

variable "vpc_id" {
  description = "VPC ID where to deploy the EC2 instances"
}

variable "subnet_ids" {
  description = "Subnet IDs where to deploy the EC2 instances"
}

variable "vm_instance_type" {
  description = "Instance type to deploy."
  default     = "t3a.small"
}

variable "vm_disk_size" {
  description = "Disk size for the instances (Go)"
  default = "20"
}

variable "vm_os_user" {
  description = "Admin username to connect to instances via SSH. Set to 'admin' because we use debian OS."
  default     = "admin"
}


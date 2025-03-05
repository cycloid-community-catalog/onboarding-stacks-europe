#
# VPC outputs
#
output "vpc_name" {
  description = "The name for the VPC"
  value       = module.node.vpc_name
}

#
# Instance outputs
#
output "vm_name" {
  description = "The name the instance"
  value       = module.node.vm_name
}

output "vm_ip" {
  description = "The IP address the instance"
  value       = module.node.vm_ip
}

output "vm_ssh" {
  description = "The SSH address to connect to the instance"
  value       = "${module.node.vm_os_user}@${module.node.vm_ip}"
}

output "url" {
  description = "The URL of the wepapp"
  value       = "http://${module.node.vm_ip}"
}
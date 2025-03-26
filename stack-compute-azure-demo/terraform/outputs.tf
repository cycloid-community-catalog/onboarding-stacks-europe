output "resource_group_name" {
  description = "The resource group name where to deploy the instance"
  value       = module.compute.resource_group_name
}

output "ssh" {
  description = "The SSH address to connect to the instance"
  value       = "${module.compute.vm_os_user}@${module.compute.vm_public_ip}"
}

output "vm_name" {
  description = "The SSH address to connect to the instance"
  value       = module.compute.vm_name
}

output "url" {
  description = "The URL of the wepapp"
  value       = "http://${module.compute.vm_public_ip}"
}
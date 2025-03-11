# This is a trick to get the updated public IP address even after a change
output "public_ip_addresses" {
  value = [ for vm in data.aws_instance.ec2: vm.public_ip]
}

output "instance_ids" {
  value = [ for vm in data.aws_instance.ec2: vm.id]
}

output "ssh_public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}

output "ssh_private_key" {
  value = tls_private_key.ssh_key.private_key_openssh
  sensitive = true
}
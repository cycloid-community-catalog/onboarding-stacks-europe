output "instance_name" {
  description = "The name of the Cloud SQL instance"
  value       = module.database.instance_name
}

output "connection_name" {
  description = "The connection name of the Cloud SQL instance"
  value       = module.database.connection_name
}

output "public_ip_address" {
  description = "The public IP address of the Cloud SQL instance"
  value       = module.database.public_ip_address
}

output "private_ip_address" {
  description = "The private IP address of the Cloud SQL instance"
  value       = module.database.private_ip_address
}

output "database_name" {
  description = "The name of the database"
  value       = module.database.database_name
}

output "database_user" {
  description = "The name of the database user"
  value       = module.database.database_user
}

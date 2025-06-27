output "mysql_server_fqdn" {
  description = "The FQDN of the MySQL Flexible Server"
  value       = module.database.mysql_server_fqdn
}

output "mysql_server_name" {
  description = "The name of the MySQL Flexible Server"
  value       = module.database.mysql_server_name
}

output "database_name" {
  description = "The name of the database"
  value       = module.database.database_name
} 
output "mysql_server_name" {
  description = "The name of the MySQL Flexible Server"
  value       = azurerm_mysql_flexible_server.mysql.name
}

output "mysql_server_fqdn" {
  description = "The fully qualified domain name of the MySQL Flexible Server"
  value       = azurerm_mysql_flexible_server.mysql.fqdn
}

output "mysql_server_id" {
  description = "The ID of the MySQL Flexible Server"
  value       = azurerm_mysql_flexible_server.mysql.id
}

output "database_name" {
  description = "The name of the database"
  value       = azurerm_mysql_flexible_database.database.name
}

output "connection_string" {
  description = "The connection string for the MySQL database"
  value       = "mysql://${var.administrator_login}:${random_password.mysql.result}@${azurerm_mysql_flexible_server.mysql.fqdn}:3306/${var.database_name}"
  sensitive   = true
} 
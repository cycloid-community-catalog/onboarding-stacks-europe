output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.rds_endpoint
}

output "rds_port" {
  description = "The port on which the DB accepts connections"
  value       = module.rds.rds_port
}

output "database_name" {
  description = "The name of the database"
  value       = module.rds.database_name
} 
output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.rds_endpoint
}
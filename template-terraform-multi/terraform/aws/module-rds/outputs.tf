#
# RDS instance outputs
#

output "rds_endpoint" {
  description = "Endpoint for the RDS instance"
  value       = aws_db_instance.rds.endpoint
}

output "rds_username" {
  description = "The database master username"
  value       = aws_db_instance.rds.username
}

output "rds_password" {
  description = "The database master password"
  value       = random_password.password.result
  sensitive   = true
}

output "rds_db_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = aws_db_instance.rds.db_name
}
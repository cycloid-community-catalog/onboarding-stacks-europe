# Create random password
resource "random_password" "rds" {
  length           = 16
  special          = false
}
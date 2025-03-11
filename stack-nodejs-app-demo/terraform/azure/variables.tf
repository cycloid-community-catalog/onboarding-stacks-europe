# Cycloid variables
variable "cyenv" {}
variable "cyproject" {}
variable "cyorg" {}

# Cloud variables
variable "azure_cred" {
  description = "The azure credential used to deploy the infrastructure. It contains subscription_id, tenant_id, client_id, and client_secret"
}

variable "cycloid_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cyorg_jwt" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}

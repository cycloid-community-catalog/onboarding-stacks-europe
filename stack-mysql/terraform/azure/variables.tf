# Cycloid variables
variable "cy_component" {}
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

# Azure variables
variable "azure_cred" {
  description = "Contains Azure subscription_id, tenant_id, client_id, and client_secret"
}

variable "cy_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cy_api_key" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}
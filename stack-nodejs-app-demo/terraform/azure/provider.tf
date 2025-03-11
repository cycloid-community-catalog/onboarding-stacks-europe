provider "azurerm" {
  features {}
  client_id       = var.azure_cred.client_id
  client_secret   = var.azure_cred.client_secret
  subscription_id = var.azure_cred.subscription_id
  tenant_id       = var.azure_cred.tenant_id
  environment     = "public"
}

provider "cycloid" {
  organization_canonical = var.cyorg
  jwt                    = var.cyorg_jwt
  url                    = var.cycloid_api_url
}
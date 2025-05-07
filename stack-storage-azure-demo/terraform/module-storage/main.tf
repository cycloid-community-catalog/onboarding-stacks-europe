resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.azure_location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  min_tls_version         = "TLS1_2"
  enable_https_traffic_only = var.enable_https_traffic_only

  tags = {
    Environment = var.cy_env
    Project     = var.cy_project
    ManagedBy   = "cycloid"
  }
}

resource "azurerm_storage_container" "this" {  
  for_each = { for container in jsondecode(var.create_containers ? var.containers : "[]") : container.name => container }

  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = each.value.access_type
} 
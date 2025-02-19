provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/" # Authentication URL
  domain_name = "default" # Domain name - Always at 'default' for OVHcloud
  region      = var.ovh_region
  tenant_name = var.ovh_cred.tenant_id
  user_name   = var.ovh_cred.username
  password    = var.ovh_cred.password
}

provider "cycloid" {
  organization_canonical = var.cy_org
  jwt                    = var.cycloid_jwt
  url                    = var.cycloid_api_url
}
provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/" # Authentication URL
  domain_name = "default" # Domain name - Always at 'default' for OVHcloud
}

provider "cycloid" {
  organization_canonical = var.cy_org
  jwt                    = var.cycloid_jwt
  url                    = var.cycloid_api_url
}
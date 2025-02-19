provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/" # Authentication URL
  domain_name = "default" # Domain name - Always at 'default' for OVHcloud
  region      = var.ovh_region
  user_name   = var.ovh_cred.username
  password    = var.ovh_cred.password
}
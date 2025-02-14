provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/" # Authentication URL
  domain_name = "default" # Domain name - Always at 'default' for OVHcloud
  user_name   = var.ovh_cred.username
  tenant_name = var.ovh_cred.tenant_name
  password    = var.ovh_cred.password
  alias       = "ovh" # An alias
}

provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.ovh_cred.application_key
  application_secret = var.ovh_cred.application_secret
  consumer_key       = var.ovh_cred.consumer_key
}

provider "ionoscloud" {
  token = var.ionos_cred.token
}
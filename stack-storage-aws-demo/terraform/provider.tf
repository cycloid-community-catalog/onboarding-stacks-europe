provider "aws" {
  access_key = var.aws_cred.access_key
  secret_key = var.aws_cred.secret_key
  region     = var.aws_region

  default_tags { # The default_tags block applies tags to all resources managed by this provider, except for the Auto Scaling groups (ASG).
    tags = {
      cy_org       = var.cy_org
      cy_project   = var.cy_project
      cy_env       = var.cy_env
      cy_component = var.cy_component
    }
  }
}
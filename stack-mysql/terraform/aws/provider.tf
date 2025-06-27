provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      cy_org       = var.cy_org
      cy_project   = var.cy_project
      cy_env       = var.cy_env
      cy_component = var.cy_component
    }
  }
} 
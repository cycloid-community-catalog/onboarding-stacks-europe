module "s3" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-s3"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  # S3 configuration
  bucket_name            = var.bucket_name
  aws_region             = var.aws_region
  versioning_enabled     = var.versioning_enabled
  custom_lifecycle_rules = var.custom_lifecycle_rules
  lifecycle_rules        = var.lifecycle_rules
} 
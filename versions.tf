############################################
# version of terraform and providers
############################################
terraform {
  required_version = "~> 1.2.0"

  required_providers {
    aws      = "~> 4.4.0"
  }

  # uncomment if you use s3 for backend
  backend s3 {}
}
locals {
  common_tags = {
    "project" = var.project
    "region"  = var.region
    "env"     = var.env
    "managed" = "terraform"
  }
}

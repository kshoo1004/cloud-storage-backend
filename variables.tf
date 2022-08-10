variable "project" {
  type        = string
  default     = ""
  description = "project code which used to compose the resource name"
}

variable "region" {
  type        = string
  default     = ""
  description = "aws region to build network infrastructure"
}

variable "env" {
  type        = string
  default     = ""
  description = "environment: dev, stg, qa, prod "
}

variable "dynamo_table_maps" {
  default     = {}
  description = "maps to create dyanmo's table for terraform lock"
}

variable "create_s3_bucket" {
  type        = bool
  default     = true
  description = "s3 bucket name to store the terraform state"
}

variable "s3_bucket_name" {
  type        = string
  default     = ""
  description = "s3 bucket name to store the terraform state"
}

variable "enable_s3_bucket_versioning" {
  type        = bool
  default     = true
  description = "enable s3 bucket versioning. Once enabled, it cannot be disabled. It just turns into `Suspended`"
}

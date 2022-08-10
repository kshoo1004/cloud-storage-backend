# Create S3 bucket for backend
resource "aws_s3_bucket" "s3" {
  count  = var.create_s3_bucket ? 1 : 0
  bucket = var.s3_bucket_name

  tags = merge(
    local.common_tags,
    tomap({ "Name" = var.s3_bucket_name })
  )

  force_destroy = true
}

# # Modify tags of exist S3 bucket for backend
# # You must run `terraform import` before `terraform plan`
# # e.g. terraform import aws_s3_bucket.exist_s3 <S3_BUCKET_NAME>
# # Notice: S3 bucket is deleted after `terraform destroy`
# resource "aws_s3_bucket" "exist_s3" {
#   count  = var.create_s3_bucket ? 0 : 1
#   bucket = var.s3_bucket_name
#   tags = merge(
#     local.common_tags,
#     tomap({ "Name" = var.s3_bucket_name })
#   )
# }

# Enable s3 bucket versioning
# Notice: Once enabled, it cannot be disabled. It just turns into `Suspended`.
resource "aws_s3_bucket_versioning" "s3" {
  count  = var.enable_s3_bucket_versioning ? 1 : 0
  bucket = var.create_s3_bucket ? aws_s3_bucket.s3[0].id : var.s3_bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_name" {
  value = var.create_s3_bucket ? aws_s3_bucket.s3[0].bucket : var.s3_bucket_name
}

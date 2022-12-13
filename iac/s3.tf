resource "aws_s3_bucket" "terraform-state" {
 bucket = local.tf_state_bucket_name

 server_side_encryption_configuration {
   rule {
     apply_server_side_encryption_by_default {
       kms_master_key_id = aws_kms_key.terraform-bucket-key.arn
       sse_algorithm     = "aws:kms"
     }
   }
 }
}
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.terraform-state.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_demo" {
  bucket = aws_s3_bucket.terraform-state.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
 bucket = aws_s3_bucket.terraform-state.id

 block_public_acls       = true
 block_public_policy     = true
 ignore_public_acls      = true
 restrict_public_buckets = true
}
data "aws_caller_identity" "current" {}

locals {
  bucket_count = var.state_bucket_names != null ? length(var.state_bucket_names) : 1
}

resource "aws_s3_bucket" "state_bucket" {
  count  = local.bucket_count
  bucket = var.state_bucket_names != null ? var.state_bucket_names[count.index] : "terraform-state-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_versioning" "state_bucket" {
  count  = local.bucket_count
  bucket = aws_s3_bucket.state_bucket[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket" {
  count  = local.bucket_count
  bucket = aws_s3_bucket.state_bucket[count.index].id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = "alias/aws/s3"
    }
  }
}

resource "aws_dynamodb_table" "state_lock" {
  name         = var.state_lock_table_name != null ? var.state_lock_table_name : "terraform-state-lock-${data.aws_caller_identity.current.account_id}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

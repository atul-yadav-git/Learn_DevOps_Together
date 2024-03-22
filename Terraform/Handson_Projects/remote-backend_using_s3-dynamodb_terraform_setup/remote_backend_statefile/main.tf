# Create S3 Bucket
resource "aws_s3_bucket" "s3-remote-state" {
  bucket = "${var.bucket_name_prefix}-${var.unique_bucket_name}"

  tags = {
    Name = "s3-bucket-remote-state-terraform"
  }
}

# Enable Versioning for S3 Bucket
resource "aws_s3_bucket_versioning" "s3-versioning" {
  bucket = aws_s3_bucket.s3-remote-state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Create DynamoDB Table
resource "aws_dynamodb_table" "dynamodb-remote-state-lock" {
  name         = "${var.table_name_prefix}-${var.unique_table_name}"
  billing_mode = "PAY_PER_REQUEST" # Use PAY_PER_REQUEST for Free Tier
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "dynamodb-table-remote-state-lock"
  }
}


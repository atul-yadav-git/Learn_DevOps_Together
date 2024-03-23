output "s3_bucket_id" {
  value = aws_s3_bucket.s3-remote-state.id
}

output "dynamodb_table_id" {
  value = aws_dynamodb_table.dynamodb-remote-state-lock.id
}

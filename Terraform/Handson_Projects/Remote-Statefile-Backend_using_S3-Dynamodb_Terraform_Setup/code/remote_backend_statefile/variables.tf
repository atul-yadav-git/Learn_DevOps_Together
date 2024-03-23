variable "bucket_name_prefix" {
  description = "The prefix of the S3 bucket name"
  default     = "remote-terraform-state"
}

variable "table_name_prefix" {
  description = "The prefix name of the DynamoDB table"
  default     = "terraform-state-lock"
}

variable "unique_bucket_name" {
  description = "The name of the S3 bucket"
}

variable "unique_table_name" {
  description = "The name of the DynamoDB table"
}


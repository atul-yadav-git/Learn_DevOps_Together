#Remote backend using s3
/*
terraform {
  backend "s3" {
    bucket = "remote-terraform-state-devops-learning"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"

    # configuration for DynamoDB locking
    dynamodb_table = "terraform-state-lock-devops-learning"
  }
}
*/


# Using local system to store statefile
terraform {
  backend "local" {}
}


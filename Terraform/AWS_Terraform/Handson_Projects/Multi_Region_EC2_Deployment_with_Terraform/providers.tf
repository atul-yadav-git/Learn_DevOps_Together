# providers.tf
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 3.0" #No version constraint needed (latest compatible version will be used)
    }
  }
}



provider "aws" {
  region = var.aws_regions[0]
  alias  = "sydney"
}

provider "aws" {
  region = var.aws_regions[1]
  alias  = "singapore"
}


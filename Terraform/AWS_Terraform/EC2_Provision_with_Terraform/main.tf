# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"  # this is the Sydney region to create resources in
}

# aws_instance is used for creating EC2 instances, and "app_server" is a unique identifier used by Terraform to identify this resource; it can be anything you want

resource "aws_instance" "app_server" {
  ami           = "ami-07e1aeb90edb268a3"  # this for Amazon Linux image ID
  instance_type = "t2.micro"  # for free tier
  key_name      = "MyKeyPair"  # key pair needed to SSH into EC2; ensure the key pair exists, and the private key file is present locally

  tags = {
    Name = "terraform_created"
  }
}

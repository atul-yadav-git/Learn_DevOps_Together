resource "aws_vpc" "terraform-created" {
  cidr_block = var.vpc_cidr_block #pass values through tfvars
  tags = {
    Name = "terraform-created"
  }
}


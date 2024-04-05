resource "aws_internet_gateway" "terraform-created" {
  vpc_id = var.vpc_id

  tags = {
    Name = "terraform-created"
  }
}

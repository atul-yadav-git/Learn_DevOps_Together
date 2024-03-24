resource "aws_route_table" "terraform-created" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id  # Pass the Internet Gateway ID as a variable
  }
  
  tags = {
    Name = "terraform-created"
  }
}

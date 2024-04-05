resource "aws_security_group" "outbound_access" { #resource and resource name
  name        = "allow-all-outbound-traffic"
  description = "allow outbound internet access for your EC2 instance."

  vpc_id = var.vpc_id # remove this if want in  default vpc 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all-outbound-traffic"
  }
}




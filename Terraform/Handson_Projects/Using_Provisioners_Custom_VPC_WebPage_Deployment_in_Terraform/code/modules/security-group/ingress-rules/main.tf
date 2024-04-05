resource "aws_security_group" "inbound_access" { #resource and resource name
  name        = var.security_grp_name
  description = "to allow access to ec2 instance from internet"

  vpc_id = var.vpc_id # remove this if want in  default vpc 
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = var.security_grp_tag_name
  }
}




resource "aws_instance" "ec2" {
  ami                    = var.ami #value passed through tfvars
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = var.vpc_security_group_ids # custom security grp to attach
  tags = {
    Name = "ec2-terraform-${terraform.workspace}" #using the workspace name as part of naming
  }
}

#not specifying subnet or vpc details, so it will use default aws

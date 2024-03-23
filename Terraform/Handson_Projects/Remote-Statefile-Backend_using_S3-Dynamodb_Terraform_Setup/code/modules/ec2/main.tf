resource "aws_instance" "ec2" {
  ami           = var.ami #value passed through tfvars
  instance_type = var.instance_type
  key_name      = var.key
  vpc_security_group_ids = var.vpc_security_group_ids # to allow ssh internet access
  tags = {
    Name = "ec2-terraform-created"
  }
}

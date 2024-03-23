module "security-group-ssh-access" {
  source = "./modules/security-group"

  #passing value to variables
  from_port   = var.from_port
  to_port     = var.to_port
  protocol    = var.protocol
  cidr_blocks = var.cidr_blocks
}


module "ec2" {
  source = "./modules/ec2"

  # Passing variable values to the ec2 module
  ami           = var.ami
  instance_type = var.instance_type
  key           = var.key

  #using ouput of security group  module to pass here as  value for vpc security group
  vpc_security_group_ids = [module.security-group-ssh-access.security_group_id]
}



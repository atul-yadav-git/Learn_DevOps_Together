# main.tf

# the module we are using, their variables need to be defined here and value in tfvars
variable "instance_type" {}
variable "key" {}
variable "ami_singapore" {}
variable "ami_sydney" {}
variable "from_port" {}
variable "to_port" {}
variable "protocol" {}
variable "cidr_blocks" {}


provider "aws" {
  region = "ap-southeast-2"
  alias  = "sydney"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "singapore"
}

module "security-group_sydney" {
  source      = "./modules/security-group"
  aws_regions = ["ap-southeast-2"]

  #passing value to variables

  providers = {
    aws = aws.sydney
  }

  from_port   = var.from_port
  to_port     = var.to_port
  protocol    = var.protocol
  cidr_blocks = var.cidr_blocks
}


module "security-group_singapore" {
  source      = "./modules/security-group"
  aws_regions = ["ap-southeast-1"]

  providers = {
    aws = aws.singapore
  }
  #passing value to variables

  from_port   = var.from_port
  to_port     = var.to_port
  protocol    = var.protocol
  cidr_blocks = var.cidr_blocks
}


module "ec2_sydney" {
  source = "./modules/ec2"

  providers = {
    aws = aws.sydney
  }

  aws_regions = ["ap-southeast-2"] # region we want resource to be created in

  # Passing variable values to the ec2_sydney module

  ami           = var.ami_sydney
  instance_type = var.instance_type
  key           = var.key

  #using ouput of security group sydney module to pass here as  value for vpc security group

  vpc_security_group_ids = [module.security-group_sydney.security_group_id]

}


module "ec2_singapore" {
  source = "./modules/ec2"

  aws_regions = ["ap-southeast-1"] # region we want resource to be created in

  providers = {
    aws = aws.singapore
  }

  # Passing variable values to the ec2_sydney module

  ami           = var.ami_singapore
  instance_type = var.instance_type
  key           = var.key

  #using ouput of security group singapore module to pass here as  value for vpc security group

  vpc_security_group_ids = [module.security-group_singapore.security_group_id]
}


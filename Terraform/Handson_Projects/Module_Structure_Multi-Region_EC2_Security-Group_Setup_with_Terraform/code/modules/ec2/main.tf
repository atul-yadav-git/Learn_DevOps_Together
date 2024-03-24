
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}



resource "aws_instance" "ec2" {
  ami               = var.ami #for ami terraform doesnt allow list type to keep clarity
  instance_type     = var.instance_type
  key_name          = var.key
  
  vpc_security_group_ids = var.vpc_security_group_ids
 
  count = length(var.aws_regions)

  tags = {
    Name = var.aws_regions[count.index] == "ap-southeast-2" ? "sydney" : "singapore"
  }
}

/*
region = var.aws_regions 
#inside aws_instance resource region block is not used, its to be used in provider resource
*/

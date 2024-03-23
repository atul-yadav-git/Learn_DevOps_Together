# variables.tf

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami" {
  description = "AMI ID for region"
  type        = string
}


variable "key" {
  description = "ssh key for ec2 creation and login"
  type        = string
}


variable "aws_regions" {
  description = "define region where to create resource"
  type = list(string)
}

variable "vpc_security_group_ids" {}

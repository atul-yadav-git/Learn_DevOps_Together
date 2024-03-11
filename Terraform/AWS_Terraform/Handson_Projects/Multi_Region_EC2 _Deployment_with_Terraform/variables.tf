# variables.tf
variable "aws_regions" {
  type = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_singapore" {
  description = "AMI ID for Singapore region"
  type        = string
}

variable "ami_sydney" {
  description = "AMI ID for Sydney region"
  type        = string
}

variable "key_name" {
  description = "ssh key for ec2 creation and login"
  type        = string
}

variable "region" {
  description = "The AWS region"
  default     = "ap-southeast-2"
}


# defining variables for security group module
variable "from_port" {
  description = " port to allow request from "
  type        = number
}

variable "to_port" {
  description = " port to allow request to go to in ec2 "
  type        = number
}

variable "protocol" {
  description = "protocol used for connection"
  type        = string
}

variable "cidr_blocks" {
  description = "ips that are allowed to access"
  type        = list(string)
}



# defining variables for ec2 module
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


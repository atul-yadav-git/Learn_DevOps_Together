/*
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

variable "security_grp_tag_name" {}

variable "security_grp_name" {}
*/


variable "vpc_id" {}

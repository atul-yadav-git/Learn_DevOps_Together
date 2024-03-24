# Modules for custom VPC
module "vpc" {
  source = "./modules/custom-vpc/vpc"

  # Pass variables for VPC
  vpc_cidr_block = var.vpc_cidr_block
}

module "subnet" {
  source = "./modules/custom-vpc/subnet"

  # Pass variables for subnet
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

module "internet_gateway" {
  source = "./modules/custom-vpc/internet-gateway"

  # Pass variables for internet gateway
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./modules/custom-vpc/route-table"

  # Pass variables for route table
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

module "subnet_route_table_association" {
  source = "./modules/custom-vpc/subnet-route-table-association"

  # Pass variables for subnet-route-table-association
  subnet_id      = module.subnet.subnet_id
  route_table_id = module.route_table.route_table_id
}

# Module for EC2 instance
module "ec2" {
  source = "./modules/ec2"

  # Pass variables for EC2 instance
  ami           = var.ami
  instance_type = var.instance_type
  key           = var.key

  vpc_security_group_ids = [module.security-group-egress-all-outbound.security_group_id, module.security_group_ssh.security_group_id, module.security_group_http.security_group_id, module.security_group_https.security_group_id]

  subnet_id = module.subnet.subnet_id
  key_path  = var.key_path
}





# Modules for security groups
module "security_group_ssh" {
  source = "./modules/security-group/ingress-rules"

  # Pass variables for SSH
  from_port             = 22
  to_port               = 22
  protocol              = var.protocol
  cidr_blocks           = var.cidr_blocks
  security_grp_tag_name = "ssh_access"
  security_grp_name     = "22 port access"
  vpc_id                = module.vpc.vpc_id
}

module "security_group_http" {
  source = "./modules/security-group/ingress-rules"

  # Pass variables for HTTP
  from_port             = 80
  to_port               = 80
  protocol              = var.protocol
  cidr_blocks           = var.cidr_blocks
  security_grp_tag_name = "http_access"
  security_grp_name     = "80 port access"
  vpc_id                = module.vpc.vpc_id
}

module "security_group_https" {
  source = "./modules/security-group/ingress-rules"

  # Pass variables for HTTPS
  from_port             = 443
  to_port               = 443
  protocol              = var.protocol
  cidr_blocks           = var.cidr_blocks
  security_grp_tag_name = "https_access"
  security_grp_name     = "443 port access"
  vpc_id                = module.vpc.vpc_id
}



module "security-group-egress-all-outbound" {
  source = "./modules/security-group/egress-rules"

  # most of the values are hardcoded in egreess-rules/main.tf
  vpc_id = module.vpc.vpc_id
}


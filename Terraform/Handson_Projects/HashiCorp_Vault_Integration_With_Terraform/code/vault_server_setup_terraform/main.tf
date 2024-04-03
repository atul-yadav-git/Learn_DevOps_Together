# Module for EC2 instance
module "ec2" {
  source = "./modules/ec2"

  # Pass variables for EC2 instance
  ami           = var.ami
  instance_type = var.instance_type
  key           = var.key

  vpc_security_group_ids = [module.hashicorp_vault_port.security_group_id, module.security-group-egress-all-outbound.security_group_id, module.security_group_ssh.security_group_id]

  key_path = var.key_path
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
}


# Modules for security groups 8200 vault port
module "hashicorp_vault_port" {
  source = "./modules/security-group/ingress-rules"

  # Pass variables for vault default port 
  from_port             = 8200
  to_port               = 8200
  protocol              = var.protocol
  cidr_blocks           = var.cidr_blocks
  security_grp_tag_name = "vault_default_port"
  security_grp_name     = "8200 port access"
}


module "security-group-egress-all-outbound" {
  source = "./modules/security-group/egress-rules"

  # most of the values are hardcoded in egreess-rules/main.tf
}


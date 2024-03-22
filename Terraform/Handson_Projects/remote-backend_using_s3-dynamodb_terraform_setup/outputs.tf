
output "ec2_public_ips" {
  value = module.ec2.public_ip
}

output "ec2_private_ips" {
  value     = module.ec2.private_ip
  sensitive = true
}


output "security_group_id" {
  value = module.security-group-ssh-access.security_group_id
}



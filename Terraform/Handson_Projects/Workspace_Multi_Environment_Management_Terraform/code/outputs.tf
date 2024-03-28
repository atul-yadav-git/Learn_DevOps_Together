output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_private_ip" {
  value     = module.ec2.private_ip
  sensitive = true
}

output "security_group_ssh_id" {
  value = module.security_group_ssh.security_group_id
}

output "security_group_outbound_id" {
  value = module.security-group-egress-all-outbound.security_group_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_private_ip" {
  value     = module.ec2.private_ip
  sensitive = true
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.subnet.subnet_id
}

output "security_group_ssh_id" {
  value = module.security_group_ssh.security_group_id
}

output "security_group_http_id" {
  value = module.security_group_http.security_group_id
}

output "security_group_https_id" {
  value = module.security_group_https.security_group_id
}

output "security_group_outbound_id" {
  value = module.security-group-egress-all-outbound.security_group_id
}

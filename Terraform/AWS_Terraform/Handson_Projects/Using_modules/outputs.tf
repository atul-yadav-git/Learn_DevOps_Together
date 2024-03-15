output "ec2_sydney_public_ips" {
  value = module.ec2_sydney.public_ip
}


output "ec2_sydney_private_ips" {
  value     = module.ec2_sydney.private_ip
  sensitive = true
}


output "ec2_singapore_public_ips" {
  value = module.ec2_singapore.public_ip
}

output "ec2_singapore_private_ips" {
  value     = module.ec2_singapore.private_ip
  sensitive = true
}


output "security_group_id_singapore" {
  value = module.security-group_singapore.security_group_id
}

output "security_group_id_sydney" {
  value = module.security-group_sydney.security_group_id
}


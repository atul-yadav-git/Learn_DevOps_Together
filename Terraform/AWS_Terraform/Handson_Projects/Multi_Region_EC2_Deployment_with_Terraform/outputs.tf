output "singapore_instance_private_ip" {
  value     = aws_instance.singapore.private_ip
  sensitive = true
}

output "singapore_instance_public_ip" {
  value = aws_instance.singapore.public_ip
}

output "sydney_instance_private_ip" {
  value     = aws_instance.sydney.private_ip
  sensitive = true
}

output "sydney_instance_public_ip" {
  value = aws_instance.sydney.public_ip
}



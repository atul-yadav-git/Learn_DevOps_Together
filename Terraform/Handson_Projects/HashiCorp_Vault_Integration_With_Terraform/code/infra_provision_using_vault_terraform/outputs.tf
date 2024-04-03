output "public_ip" {
  value = aws_instance.my_instance.public_ip
  # sensitive = true
}

output "private_ip" {
  value     = aws_instance.my_instance.private_ip
  sensitive = true
}


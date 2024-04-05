resource "aws_instance" "ec2" {
  ami                    = var.ami #value passed through tfvars
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = var.vpc_security_group_ids # custom security grp to attach
  subnet_id              = var.subnet_id              # custom subnet
  tags = {
    Name = "ec2-terraform-created"
  }

  # Connection block for SSH
  connection {
    type        = "ssh"
    user        = "ec2-user"         # user to connect with
    private_key = file(var.key_path) # private key path for ssh connection
    host        = self.public_ip
  }

  # Provisioner block for Nginx setup
  provisioner "remote-exec" {
    inline = [
      "sudo dnf update -y",          # Update system dependencies
      "sudo dnf install nginx -y",   # Install nginx
      "sudo systemctl start nginx",  # Start nginx service
      "sudo systemctl enable nginx", # Enable nginx to load automatically on boot

    ]
  }

  # Provisioner block to copy files and run setup script
  provisioner "file" {
    source      = "./webpage"
    destination = "/home/ec2-user/"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/webpage/setup_nginx.sh",    # Make setup script executable
      "sudo sh /home/ec2-user/webpage/setup_nginx.sh",        # Run Nginx setup script
    ]
  }

}

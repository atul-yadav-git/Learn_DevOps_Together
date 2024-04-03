resource "aws_instance" "ec2" {
  ami                    = var.ami #value passed through tfvars
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = var.vpc_security_group_ids # custom security grp to attach
  tags = {
    Name = "terraform-created"
  }

  # Connection block for SSH
  connection {
    type        = "ssh"
    user        = "ec2-user"         # user to connect with
    private_key = file(var.key_path) # private key path for ssh connection
    host        = self.public_ip
  }

  # Provisioner block for to install hashicorp vault
  provisioner "remote-exec" {
    inline = [
      "sudo dnf update -y",     # Update system dependencies
      "sudo dnf install -y dnf-plugins-core",    # Install dnf config-manager to manage your repositories.
      "sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo",#add the official HashiCorp Linux repository.
      "sudo dnf -y install vault", # Install Vault
    ]
  }

  # Provisioner block to copy vault start script and run it
  provisioner "file" {
    source      = "./hashicorp_vault/"
    destination = "/home/ec2-user/"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/vault_server_start.sh", # Make script executable
      "sudo sh /home/ec2-user/vault_server_start.sh",# Run vault start script
    ]
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/configure_kv_secrets.sh", # Make script executable
     # "sudo sh /home/ec2-user/configure_kv_secrets.sh",# Run secret configure script
    ]
  }


}

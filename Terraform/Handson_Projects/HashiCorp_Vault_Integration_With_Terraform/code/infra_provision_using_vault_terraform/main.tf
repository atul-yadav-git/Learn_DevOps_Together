#retrive key and ami id from hashicorp vault and use that to provision ec2
data "vault_kv_secret_v2" "ec2_ami" {
  mount = "ec2-sydney" # Replace with your mount path
  name  = "ec2-ami-ssh"
}

/*
data "vault_kv_secret_v2" "ssh_key" {
  mount = "ec2-sydney" # Replace with your mount path
  name  = "key_pair"
}
*/
resource "aws_instance" "my_instance" {
  ami           = data.vault_kv_secret_v2.ec2_ami.data["ami"]
  instance_type = "t2.micro"
  key_name      = data.vault_kv_secret_v2.ec2_ami.data["key"]
  tags = {
    Name = "vault_terraform_integrated"
  }
}

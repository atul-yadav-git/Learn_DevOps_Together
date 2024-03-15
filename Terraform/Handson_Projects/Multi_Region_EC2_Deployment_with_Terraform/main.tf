# Define a security group allowing inbound SSH traffic for Sydney
resource "aws_security_group" "ssh_sg_sydney" {
  provider    = aws.sydney
  name        = "allow_ssh_sydney"
  description = "Allow inbound SSH traffic for Sydney"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_sydney"
  }
  # Add any other necessary configurations
}

# Define a security group allowing inbound SSH traffic for Singapore
resource "aws_security_group" "ssh_sg_singapore" {
  provider    = aws.singapore
  name        = "allow_ssh_singapore"
  description = "Allow inbound SSH traffic for Singapore"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_singapore"
  }
  # Add any other necessary configurations
}

# EC2 instances configuration for Sydney
resource "aws_instance" "sydney" {
  provider = aws.sydney

  ami           = var.ami_sydney
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.ssh_sg_sydney.id] # Associate the Sydney security group with the instance

  tags = {
    Name = "sydney_ec2"
  }
  # Add other configuration as needed
}

# EC2 instances configuration for Singapore
resource "aws_instance" "singapore" {
  provider = aws.singapore

  ami           = var.ami_singapore
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.ssh_sg_singapore.id] # Associate the Singapore security group with the instance

  tags = {
    Name = "singapore_ec2"
  }
  # Add other configuration as needed
}


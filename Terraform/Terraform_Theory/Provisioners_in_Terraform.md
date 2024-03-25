# Terraform Provisioners

### Table of Contents

- [Introduction](#introduction)
- [file Provisioner](#file-provisioner)
- [remote-exec Provisioner](#remote-exec-provisioner)
- [local-exec Provisioner](#local-exec-provisioner)
- [How to use Provisioners](#how-to-use-provisioners)
- [Failure Behavior](#failure-behavior)
- [Passing Data to Instances](#passing-data-to-instances)

## Introduction
-  Terraform provisioners allow you to execute scripts or transfer files on remote machines after a resource has been created.
-  This enables us to configure or prepare our instance after it's launched.
-  Provisioners run after resource creation. Ensure dependencies (e.g., network access) are configured first.
-  While technically provisioners run "after" resource creation, some might run during the creation process itself (e.g., user_data scripts on cloud platforms like AWS)
-  They come in different types, such as file, remote-exec, and local-exec provisioners, each serving specific automation needs in Terraform projects.

## file Provisioner
The `file` provisioner copies files or directories from the local machine to a remote machine, aiding in deploying configuration files, scripts, or other assets to provisioned instances.

### Example:
```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

provisioner "file" {
  source      = "local/path/to/localfile.txt"
  destination = "/path/on/remote/instance/file.txt"
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }
}
```
## remote-exec Provisioner
The remote-exec provisioner runs scripts or commands on a remote machine over SSH or WinRM connections. It's commonly used to configure or install software on provisioned instances.

Example:
```hcl

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

provisioner "remote-exec" {
  inline = [
    "sudo apt-get update",
    "sudo apt-get install -y nginx",
    "sudo systemctl start nginx",
  ]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.example.public_ip
  }
}
```
## local-exec Provisioner
The local-exec provisioner runs scripts or commands locally on the machine where Terraform is executed. It's useful for tasks that don't require remote execution.

Example:
```hcl

resource "null_resource" "example" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo 'Local command executed'"
  }
}
```
## How to use Provisioners
-  Provisioners are added inside the resource block of a compute instance.
-  The local-exec provisioner requires no additional configuration, while others must connect to the remote system using SSH or WinRM.
-  Expressions in provisioner blocks cannot refer to their parent resource by name.
-  Instead, they can use the special `self` object.
-  The self object represents the provisioner's parent resource and has all of that resource's attributes.
-  For example, use `self.public_ip` to reference an aws_instance's public_ip attribute.

## Failure Behavior
-  By default, failing provisioners cause the Terraform apply itself to fail.
-  The `on_failure` setting can be used to change this behavior, allowing provisioners to continue execution or to fail with a specific action.

## Passing Data to Instances
Most cloud computing platforms provide mechanisms to pass data to instances at the time of their creation. 

```yaml
Alibaba Cloud: user_data on alicloud_instance or alicloud_launch_template.
Amazon EC2: user_data or user_data_base64 on aws_instance, aws_launch_template, and aws_launch_configuration.
Microsoft Azure: custom_data on azurerm_virtual_machine or azurerm_virtual_machine_scale_set.
Google Cloud Platform: metadata on google_compute_instance or google_compute_instance_group.
```

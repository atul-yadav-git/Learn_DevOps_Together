# **Ansible Configuration for Linux Target Systems**

To configure Linux target systems, use SSH key pairs for passwordless authentication. 


## Generate SSH Key Pair in control system:
```
ssh-keygen
```
Save the public key in ~/.ssh/authorized-keys of all target systems.

Connect to linux target system `ssh -i <private-key> username@public-ip/dns`

## Create an inventory file in control system
/etc/ansible/hosts and add entries for Linux target systems:
```
sudo mkdir /etc/ansible
sudo touch /etc/ansible/hosts
sudo vi /etc/ansible/hosts
```
## Inventory file can have ini or yaml syntax

ini syntax
```
[linux_servers]
<public_ip> ansible_user=username ansible_host=<public_ip_or_public_dns> ansible_ssh_private_key_file=<path_to_private_key>
```
example 
```
3.106.199.4 ansible_user=ec2-user ansible_host=ec2-3-26-52-136.ap-southeast-2.compute.amazonaws.com ansible_ssh_private_key_file=/home/ssh-keys/ansible`
```
## Test connectivity using:
```
ansible linux_servers -m ping
ansible all -m ping
```

## Free Tier AWS Linux Machines: Target Linux System

-  Amazon Linux AMI: `ami-07e1aeb90edb268a3; t2.micro; 8GB gp3 storage`

-  Ubuntu AMI: `ami-04f5097681773b989; t2.micro; 8GB gp3 storage`

-  Red Hat AMI: `ami-0d6857b844e855670; t2.micro; 10GB gp3 storage`

---
# OPTIONAL: Using environment variables to store credentials
---
```
Using environment variables to store the path to your private key file. 

This allows you to keep the actual path separate from the inventory file, enhancing security. 
```
### Create an environment variable:
Open your terminal and set an environment variable named ANSIBLE_PRIVATE_KEY_FILE with the actual path to your private key file:
```
export ANSIBLE_PRIVATE_KEY_FILE=<private-key-file-path>
```

Update inventory file:

`ansible_ssh_private_key_file={{ env.ANSIBLE_PRIVATE_KEY_FILE }}` Replace the path with a reference to the environment variable



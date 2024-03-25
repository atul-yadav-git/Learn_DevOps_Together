# WebPage Deployment using Provisioners along with Custom VPC Setup and EC2 Deployment with Terraform
-  This project aims to automate the setup of a custom Virtual Private Cloud (VPC) on AWS using Terraform, along with the deployment of an EC2 instance within the VPC.
-  The process involves creating custom VPC components, configuring security groups, and deploying a simple webpage using HTML, CSS, JavaScript, and Nginx.

## Prerequisites:
```yaml
Terraform Installed: Ensure Terraform is installed on your local machine.
AWS CLI Configured: Configure AWS CLI with appropriate credentials for accessing AWS services.
SSH Key Pair: Create an SSH key pair and ensure it's available in the required regions.
```
## Project Overview:
-  Custom VPC Setup:
    -  Creation of a custom VPC with a public subnet, internet gateway, route table, and subnet-route table association.
    -  Modular organization using Terraform modules for better management.

-  EC2 Deployment:
    -  Provisioning of an EC2 instance within the custom VPC.
    -  Configuration of security group rules to allow inbound and outbound traffic.

-  Webpage Deployment:
    -  Setup of a simple webpage using HTML, CSS, and JavaScript.
    -  Installation and configuration of the Nginx web server on the EC2 instance.

## Steps to Set Up the Project:
Initialize Terraform:

```bash
terraform init
```
Review and Apply the Terraform Plan:

```bash
terraform plan
terraform apply
```
### Access the Deployed Webpage:

-  Retrieve the public IP of the EC2 instance.
-  Access the webpage through the public IP in a web browser.

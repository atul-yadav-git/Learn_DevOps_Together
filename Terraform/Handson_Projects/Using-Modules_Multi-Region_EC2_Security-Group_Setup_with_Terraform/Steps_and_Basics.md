# Using Terraform Modules Multi-Region EC2 Deployment

- This project aims to create AWS EC2 instances in multiple regions using Terraform modules for better organization and reusability.

## Prerequisites:
- Terraform installed
- AWS CLI installed and configured with proper credentials
- SSH key pair created and available in required regions

## Concepts Covered:

- Variables: Declaring and using variables in Terraform for flexibility and reusability.
- Input Variables (variables.tf): Defining input variables for dynamic configurations such as AWS regions, instance types, AMIs, and key pairs.
- Output Variables (outputs.tf): Exposing specific information about the deployed resources, such as instance IPs.
- Sensitive Output Variables (outputs.tf): Marking sensitive output variables to prevent sensitive information from being displayed in plain text.
- Multi-Region Deployment using Modules (main.tf): Utilizing Terraform modules for creating resources in multiple AWS regions with better code organization and management.
- EC2 and Security Group Resources (modules): Defining AWS EC2 instances and security groups with specific configurations, including ingress rules for SSH access.

## Project Structure:
```bash
.
├── main.tf
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── outputs.tf_backup
│   │   └── variables.tf
│   └── security-group
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── providers.tf
├── README.md
├── terraform.tfvars
└── variables.tf


```
Project Files Overview:
```yaml
README.md: Project documentation providing an overview and instructions.
variables.tf: Declare variables for the project, including AWS regions, instance types, AMIs, and key pairs.
outputs.tf: Specify output values for display after deployment.
terraform.tfvars: Configuration variables for AWS regions, instance types, AMIs, and key pairs.
providers.tf: Define AWS provider and specify required version.
main.tf: Utilize Terraform modules for creating resources in multiple AWS regions.
modules/ec2/main.tf: Define AWS EC2 instances with specific configurations.
modules/ec2/variables.tf: Declare variables for the EC2 module.
modules/ec2/outputs.tf: Specify output values for the EC2 module.
modules/security-group/main.tf: Define AWS security groups with specific configurations.
modules/security-group/variables.tf: Declare variables for the security group module.
modules/security-group/outputs.tf: Specify output values for the security group module.
```
## Steps to Set Up the Project:
### Create Project Directory:

```bash
mkdir using_modules_multi_region_ec2_security_group_setup
cd using_modules_multi_region_ec2_security_group_setup
```
Create and Populate Terraform Files:

```bash
touch main.tf variables.tf providers.tf outputs.tf terraform.tfvars
mkdir modules
mkdir modules/ec2
mkdir modules/security-group
touch modules/ec2/main.tf modules/ec2/variables.tf modules/ec2/outputs.tf
touch modules/security-group/main.tf modules/security-group/variables.tf modules/security-group/outputs.tf
```
After executing these commands, your project directory will have the required structure and files 

Review and Update Terraform Files:

Ensure that the variables in terraform.tfvars are correctly configured for your AWS environment. Update any other configuration files as needed.

### Initialize the project:
```bash
terraform init
```
Format and Validate Terraform Files:
```bash
terraform fmt
terraform validate
```
Plan the changes:
```bash
terraform plan
```
Apply the changes:
```bash
terraform apply
```
Destroy resources:
```bash
terraform destroy
```
### Additional Notes:
-  Ensure that your AWS credentials are properly configured and have the necessary permissions for creating EC2 instances and security groups.
-  Review the Terraform documentation for any updates or changes in best practices.

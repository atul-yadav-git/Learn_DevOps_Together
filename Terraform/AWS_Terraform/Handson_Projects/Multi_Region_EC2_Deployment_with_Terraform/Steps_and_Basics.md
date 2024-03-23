# Multi-Region EC2 Deployment with Terraform
-  This project aims to provide hands-on experience with Terraform, focusing on creating AWS EC2 instances in multiple regions. 

-  Key objectives include understanding and practicing concepts such as variables, input and output variables, sensitive outputs, multi-region deployment using aliases, and the creation of EC2 instances and security groups.

## Prerequisites:
-  Terraform installed
-  AWS CLI installed and configured with proper credentials
-  SSH key pair created and available in required regions
   
## Concepts to be Learned:

-  Variables: Declare and use variables in Terraform to enhance flexibility and reusability.
-  Input Variables (variables.tf): Define input variables for dynamic configurations, such as AWS regions, instance type, AMIs, and key pairs.
-  Output Variables (outputs.tf): Utilize output variables to expose specific information about the deployed resources, such as instance IPs.
-  Sensitive Output Variables (outputs.tf): Mark sensitive output variables to prevent sensitive information from being displayed in plain text.
-  Multi-Region Deployment using Alias (providers.tf): Deploy resources in multiple AWS regions using provider aliases for better control and isolation.
-  EC2 and Security Group Resources (main.tf): Define AWS EC2 instances and security groups with specific configurations, including ingress rules for SSH access.


## Project Structure:
```bash
- terraform.tfvars
- providers.tf
- variables.tf
- main.tf
- outputs.tf
- terraform.tfstate
```
## Project Files Overview:
```yaml
terraform.tfvars: Configuration variables for AWS regions, instance type, AMIs, and key pair.
providers.tf: Define AWS provider and required version.
variables.tf: Declare variables for the project.
main.tf: Define AWS resources, including security groups and EC2 instances.
outputs.tf: Specify output values for display.
terraform.tfstate: The current state of your infrastructure.
```
## Steps to Set Up the Project:
Create Project Directory:

```bash
mkdir multi_region_ec2_terraform
cd multi_region_ec2_terraform
```
Create and populate Terraform Files:

```bash
touch main.tf variables.tf providers.tf outputs.tf terraform.tfvars
```
## Executing Terraform Commands:

Initialize the project:
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
## Additional Notes:

`terraform output` will print the values mentioned in output.tf.

`terraform show` displays the statefile. While sensitive values might be displayed here, users with only statefile access can view them.

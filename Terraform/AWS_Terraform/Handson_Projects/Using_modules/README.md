# Using Terraform Modules Multi-Region EC2 Deployment
This project aims to create AWS EC2 instances in multiple regions using Terraform modules for better organization and reusability.


### Key Objectives:
```yaml
-  Understanding Variables: Practice declaring and utilizing variables in Terraform to enhance flexibility and maintainability.
-  Input and Output Variables: Define input variables for dynamic configurations and output variables to expose relevant information about deployed resources.
-  Sensitive Outputs: Implement sensitive output variables to protect confidential information from being displayed in plain text.
-  Multi-Region Deployment using Modules: Deploy resources across multiple AWS regions using Terraform modules for better organization and management.
-  Creating EC2 Instances and Security Groups: Utilize Terraform modules to define AWS EC2 instances and security groups with specific configurations.
```
### Project Structure:
```yaml
.
├── main.tf
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── outputs.tf_backup
│   │   └── variables.tf
│   └── security-group
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── providers.tf
├── README.md
├── terraform.tfvars
└── variables.tf
```

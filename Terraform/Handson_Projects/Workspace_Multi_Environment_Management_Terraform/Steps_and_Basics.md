# Multi-Environment Management using Terraform Workspaces 

## Purpose

-  The purpose of this project is to showcase the utilization of Terraform workspaces for managing different environments within the same infrastructure configuration.
-  It demonstrates the creation of EC2 instances and corresponding security rules, attaching the security rules to the EC2 instances.

## Prerequisites

Before getting started, ensure you have the following:
```yaml
Terraform Installed: Make sure Terraform is installed on your local machine.
AWS CLI Configured: Configure AWS CLI with appropriate credentials for accessing AWS services.
SSH Key Pair: Create an SSH key pair and ensure it's available in the required regions.
```
## Functionality

-  The project creates EC2 instances and corresponding security rules, attaching the security rules to the EC2 instances. 
-  It aims to demonstrate the usage of Terraform workspaces for managing different environments, such as production and development.

## Execution Steps

Follow these steps to execute the project:

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```
Workspace Commands:

Show current workspace and list available workspaces:
```bash

terraform workspace show/list
```
Create and switch to a new workspace:
```bash

terraform workspace new <workspace name>
```
Select a workspace:
```bash

terraform workspace select < workspace name>
```
Review and Apply the Terraform Plan:

```bash

terraform plan -var-file=<custom.tfvars>
terraform apply -var-file=<custom.tfvars>
```

Accessing the Deployed Resources:
```bash
terraform output #Retrieve the necessary information (e.g., public IP addresses) from the Terraform outputs to access the deployed resources.
```
### Additional Notes
```yaml
Workspace Usage: Terraform workspaces facilitate managing multiple environments within a single configuration, enabling efficient infrastructure management.
Reduced Configuration Duplication: Utilizing workspaces reduces the need for duplicating entire configurations for different environments, enhancing code maintainability.
```

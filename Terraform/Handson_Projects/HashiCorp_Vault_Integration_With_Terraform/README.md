# HashiCorp-Vault Secret Management Integrated Terraform Infrastructure Provisioning

This project demonstrates how Terraform and HashiCorp Vault can work together to manage secrets and provision infrastructure securely.

## Purpose:

-  Showcase the integration of HashiCorp Vault secret management with Terraform infrastructure provisioning.
-  Illustrate a multi-step process for setting up and provisioning infrastructure securely.
-  Utilizes Terraform modules to provision EC2 instances and security groups for Vault setup.
-  Implements provisioners to copy role and policy files to the Vault server, ensuring proper configuration.
-  In the infrastructure provisioning step, retrieves EC2 keys and AMI IDs stored in Vault for resource creation.
  
## Project Details

- **Step 1: Provision EC2 and Start Vault in Development Server**
  - This step involves provisioning EC2 instances and starting Vault in the development server. The modules for security groups and EC2 instances are implemented here.

- **Step 2: Setting up Roles and Policies for Terraform**
  - This step utilizes Terraform provisioners to execute scripts for creating roles and policies on the Vault server. These configurations need to be executed to set up roles and policies for Terraform.

- **Step 3: Provisioning EC2 with Secrets from Vault**
  - Using Vault, EC2 key and AMI ID are stored. Terraform utilizes AppRole authentication to authenticate with Vault and provision resources.


## Project Structure
```css
.
├── infra_provision_using_vault_terraform
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── variables.tf
└── vault_server_setup_terraform
    ├── hashicorp_vault
    │   ├── configure_kv_secrets.sh
    │   ├── README.md
    │   ├── terraform-policy.hcl
    │   └── vault_server_start.sh
    ├── main.tf
    ├── modules
    │   ├── ec2
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── security-group
    │       ├── egress-rules
    │       │   ├── main.tf
    │       │   └── outputs.tf
    │       └── ingress-rules
    │           ├── main.tf
    │           ├── outputs.tf
    │           └── variables.tf
    ├── outputs.tf
    ├── providers.tf
    ├── README.md
    └── variables.tf

```
## Key Features:
```yaml
Modular Structure: Organizes code into modules for EC2 provisioning and security group setup, enhancing readability and maintainability.
Vault Integration: Seamlessly integrates with HashiCorp Vault to store and retrieve sensitive data, ensuring secure provisioning.
Role-Based Access Control: Sets up roles and policies for Terraform, enforcing proper access controls for infrastructure management.
Secrets Management: Demonstrates the secure storage and retrieval of EC2 keys and AMI IDs using Vault, enhancing overall security posture.
Automation: Automates the provisioning process, reducing manual intervention and ensuring consistency in infrastructure deployment.
```

## Benefits
```yaml
- **Enhanced Security**: Leverage HashiCorp Vault for secure storage and retrieval of sensitive infrastructure secrets like EC2 keys and AMI IDs.
- **Reduced Manual Errors**: Automate infrastructure provisioning with Terraform, minimizing human intervention and potential errors.
- **Increased Efficiency**: Streamline infrastructure deployment with reusable modules.
```

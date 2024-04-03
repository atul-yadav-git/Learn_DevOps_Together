# HashiCorp Vault Secret Management and Terraform Infrastructure Provisioning
## Purpose:

-  Showcase the integration of HashiCorp Vault secret management with Terraform infrastructure provisioning.
-  Illustrate a multi-step process for setting up and provisioning infrastructure securely.
-  Utilizes Terraform modules to provision EC2 instances and security groups for Vault setup.
-  Implements provisioners to copy role and policy files to the Vault server, ensuring proper configuration.
-  In the infrastructure provisioning step, retrieves EC2 keys and AMI IDs stored in Vault for resource creation.
  
## Prerequisites

Before getting started, ensure you have the following:
```yaml
- Terraform Installed: Make sure Terraform is installed on your local machine.
- AWS CLI Configured: Configure AWS CLI with appropriate credentials for accessing AWS services.
- SSH Key Pair: Create an SSH key pair and ensure it's available in the required regions.
```

## Project Structure
The project utilizes a clear directory structure:
```yaml
vault_server_setup_terraform: Contains Terraform configurations for provisioning the Vault server and setting up roles/policies.
infra_provision_using_vault_terraform: Contains Terraform configurations for infrastructure provisioning using secrets retrieved from Vault.
```

---

## Execution Steps

Follow these steps to execute the project:

- **Step 1: Provision EC2 and Start Vault in Development Server**
   - Navigate to the `vault_server_setup_terraform` directory and run `terraform init` followed by `terraform apply`
   - It will provision ec2 and using provisioners copy policy files and secret setup scripts into vault server and start vaut in dev server
     
- **Step 2: Setting up Roles and Policies for Terraform**
   - In this step, ssh into the ec2 vault server
   - `cat` the vault server startup log file there and `export vault_addr` and give command `vault login` and enter root token provided in vault server statup log.
   - Post that execute the configure secrets script, which will enable kv engine and do creation of roles, policies.
   - We just have to then copy the provided role id and secret id into tfvars of infra provision directory
     
- **Step 3: Provisioning EC2 with Secrets from Vault**
   - Using the role ID and secret ID obtained in Step 2, Terraform will access Vault and authenticate using AppRole.
   - Terraform will then retrieve the key and AMI ID stored in Vault.
   - With the required secrets, Terraform will provision resources as per the configuration code.

---

## Execution Commands

Initialize Terraform:
   ```bash
   terraform init
   ```
Review and Apply the Terraform Plan:
```bash
terraform plan 
terraform apply 
```
Accessing the Deployed Resources:
```bash
terraform output #Retrieve the necessary information (e.g., public IP addresses) from the Terraform outputs to access the deployed resources.
```

---

## Additional Notes

- **Creation Process:**
  - Start by provisioning the Vault infrastructure.
  - Configure secrets within Vault.
  - Proceed to create the actual infrastructure using the secrets stored in Vault.

- **Destruction Process:**
  - Begin by destroying the actual infrastructure.
  - Then, dismantle the Vault infrastructure.

- **Expiration Reminder:**
  - Role ID and secret ID have an expiry limit of 20 minutes, necessitating regeneration if necessary.


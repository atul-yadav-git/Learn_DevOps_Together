# Project Structure

The project is structured as follows:

- **vault_server_setup_terraform:** Contains Terraform configurations for provisioning the Vault server and setting up roles/policies.
- **infra_provision_using_vault_terraform:** Contains Terraform configurations for infrastructure provisioning using secrets retrieved from Vault.

## Execution Steps

Follow these steps to execute the project:

### Step 1: Provision EC2 and Start Vault in Development Server

1. Navigate to the `vault_server_setup_terraform` directory.
2. Run `terraform init` followed by `terraform apply`.
   - This step will provision EC2, copy policy files and secret setup scripts into the Vault server, and start Vault in dev server mode.

### Step 2: Setting up Roles and Policies for Terraform

1. SSH into the EC2 Vault server.
2. Read the Vault server startup log file and export `vault_addr`.
3. Run `vault login` and enter the root token provided in the Vault server startup log.
4. Execute the configure secrets script to enable the KV engine and create roles/policies.
5. Copy the provided role ID and secret ID into the tfvars of the `infra_provision_using_vault_terraform` directory.

### Step 3: Provisioning EC2 with Secrets from Vault

1. Navigate to the `infra_provision_using_vault_terraform` directory.
2. Run `terraform init` followed by `terraform apply`
3. Using the role ID and secret ID obtained in Step 2, Terraform will access Vault and authenticate using AppRole.
4. Terraform will retrieve the key and AMI ID stored in Vault.
5. With the required secrets, Terraform will provision resources as per the configuration code.

---

## Infrastructure Destruction

Before destroying the infrastructure, ensure to follow these steps:

1. Execute `terraform destroy` for the `infra_provision_using_vault_terraform` directory to delete the provisioned infrastructure.
   - This ensures that resources using Vault secrets are terminated first, preventing access issues.
2. After confirming the deletion of resources, proceed with destroying the Vault server infrastructure.
   - This eliminates the dependency and cleans up the Vault environment.


---

> *Note: Ensure to create a `.tfvars` file customized based on your own requirements.*

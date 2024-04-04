# Provisioning EC2 and Starting Vault Server

-  This code provisions an EC2 instance and starts the Vault server in development mode on the EC2 instance using provisioners.
-  It also copies files into the EC2 server using file provisioners.

## File Copied to EC2 Vault Server

- The script copies necessary files into the EC2 server for setup.

```yaml
Vault Server Start Script : This script starts the Vault server in development mode on the EC2 instance and captures logs for debugging purposes.

Terraform Policy : This policy defines the permissions for accessing secrets in the `ec2-sydney` path within Vault.

Configure KV Secrets Script : This script configures the KV secret engine, stores secrets, creates policies, and generates AppRole credentials.
```
## Post Terraform Apply Succession and EC2 Provisioned with Required Setup

After successfully applying the Terraform configuration, perform the following steps:

1. Login to the EC2 Vault server to access the Vault CLI and complete the setup.
2. View the Vault startup log file created in the home directory of the EC2 instance.
3. Export the `VAULT_ADDR` as per the Vault startup log and log in to Vault 'vault login` using the root token obtained from the startup log file.
4. Run the configure KV script to configure secrets, create policies, and generate AppRole credentials.

## Provisioning EC2 Using Secrets Stored in Vault Integrated to Terraform

1. Update the `tfvars` file in the `infra_provision_using_vault_terraform` directory with the generated role ID and secret ID from the Vault server setup.
2. Follow the execution steps mentioned in the project README for provisioning infrastructure with secrets from Vault.

---

> **Note:** Ensure to create the `tfvars` file custom based on your requirements.

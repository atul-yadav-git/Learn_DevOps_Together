# Terraform Vault Secret Management & HashiCorp Vault Setup and Installation

### Table of Contents

1. [Official Links for Reference](#official-links-for-reference)
2. [Terraform Resource and Data Blocks](#terraform-resource-and-data-blocks)
3. [Vault Port](#vault-port)
4. [Vault Server Operation](#vault-server-operation)
5. [Accessing Vault](#accessing-vault)
6. [Secret Engines in Vault](#secret-engines-in-vault)
7. [Role and Policy Management](#role-and-policy-management)
8. [Authentication Methods in Vault](#authentication-methods-in-vault)
9. [Terraform Authentication with Vault](#terraform-authentication-with-vault)
10. [Vault CLI Command Examples](#vault-cli-command-examples)
11. [Vault Configuration Steps](#vault-configuration-steps)
12. [Dynamically Fetching AppRole Credentials](#dynamically-fetching-approle-credentials)
13. [Vault Agent Setup](#vault-agent-setup)
14. [Referencing Vault Data in Terraform Code](#referencing-vault-data-in-terraform-code)
15. [Terraform Workflow](#terraform-workflow)
16. [Vault UI Interface](#vault-ui-interface)
17. [Script Execution with Environment Variables](#script-execution-with-environment-variables)
18. [Best Practices](#best-practices)

---

## Official Links for Reference
- [HashiCorp Vault Getting Started](https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-intro)
- [HashiCorp Vault Secrets Engines](https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-secrets-engines)
- [KV Secrets Engine ACL Rules](https://developer.hashicorp.com/vault/docs/secrets/kv/kv-v2#acl-rules)
- [AppRole Authentication](https://developer.hashicorp.com/vault/docs/auth/approle)

## Terraform Resource and Data Blocks
-  Terraform `resources` block are used to create and manage infrastructure components.
-  `Data` blocks retrieve data from external sources, including Vault.

## Vault Port
-  The default Vault API port is TCP 8200.

## Vault Server Operation
-  The Vault server should run continuously, either in the background or a separate terminal.

## Accessing Vault
- Using UI: http://publicip:8200
- Using CLI: Preferred method for learning and navigating Vault

## Secret Engines in Vault
-  Secret engines define how secrets are stored within Vault.
-  Choose the appropriate engine based on your needs (e.g., KV v2 for simple key-value storage, AWS secrets, Kubernetes, etc.).

## Role and Policy Management
-  Roles define entities (applications or users) that can access secrets.
-  Policies control user access to Vault data. 
-  Create policies and associate them with roles for access control.

## Authentication Methods in Vault
- Token is the core authentication method.
- Vault supports various authentication methods such as GitHub, AppRole, AWS, etc.
- Use Vault CLI commands to enable authentication methods.

## Terraform Authentication with Vault
-  Terraform requires a role ID and secret ID to authenticate with Vault using AppRole auth method, similar to AWS access keys.

## Vault CLI Command Examples
- Enable Authentication: `vault auth enable github`  # can be approle, aws, etc
- Enable Secret Engine: `vault secrets enable -path=aws aws`
- List Secret Engines: `vault secrets list`
- Read Policy: `vault policy read <policy-name>`
- List Policies: `vault policy list`
- Write Policy: `vault policy write <policyname>`


## Vault Configuration Steps
### 1. Set up Vault CLI access.
```bash
   ## Configure Vault
1. Set Vault Address: `export VAULT_ADDR='http://0.0.0.0:8200'`
2. Login: `vault login`
```
**Vault CLI Best Practice:**

- Use `vault login` instead of setting token directly.
- Ensures consistent authentication within the session.
- For automation, manage tokens programmatically.
### 2. Enable secret engines.
```bash
Enable Secret Engine: `vault secrets enable -path=ec2-sydney kv-v2`
```
### 3. Create and manage secrets.
```bash
Put Secret: `vault kv put ec2-sydney/ec2-ami-ssh ami="ami-07e1aeb90edb268a3" key="MyKeyPair"`
```
### 4. Create policies and roles for authentication.
```bash
## Creating Policy
   path "/ec2-sydney/*" {
     capabilities = ["read"]
   }
#Write Policy:
vault policy write terraform-policy terraform-policy.hcl

#Create Vault Role:
vault write auth/approle/role/terraform-role ...
```
### 5. Authenticate with AppRole.
```bash
#To authenticate with AppRole, first fetch the role ID. Next, get a secret ID.

vault read -field=role_id auth/approle/role/terraform-role/role-id
vault write -f -field=secret_id auth/approle/role/terraform-role/secret-id

#Finally, authenticate to AppRole by specifying the role path and passing the role ID and secret ID values with the respective values.
vault write auth/approle/login role_id="<role-id>" secret_id="<secret-id>"

vault kv get -mount=ec2-sydney ec2-ami-ssh # will list secrets present in the kv secret engine, under the ec2-sydney mount point and ec2-ssh-ami secret path
```

## Dynamically Fetching AppRole Credentials

1. **External Data Source:**
   - *Pros*: Flexible for custom logic or integration.
   - *Cons*: Least secure; potential vulnerabilities and complexity.
   - *Recommendation*: Not ideal for production due to security concerns.

2. **Vault Agent:**
   - *Pros*: Most secure; automatic token management.
   - *Cons*: Requires installation and configuration.
   - *Recommendation*: Strongly recommended for production environments.

3. **Environment Variables:**
   - *Pros*: Simple setup.
   - *Cons*: Least secure; risk of exposure.
   - *Recommendation*: Suitable for tightly controlled development environments.

*Best Method:* Vault Agent offers a balance of security, automation, and ease of use, making it the most recommended approach for Terraform's Vault authentication.


## Vault Agent Setup
1. **Install Vault Agent:** Download and install the Vault Agent binary from HashiCorp's official website. Ensure installation on the machine where Terraform is executed.

2. **Create Configuration File:** Prepare a Vault Agent configuration file according to your requirements.

3. **Start Vault Agent:** Execute Vault Agent with the specified configuration file.`vault agent -config=/etc/vault/agent-config.hcl`

## Referencing Vault Data in Terraform Code

This example retrieves an EC2 AMI and SSH key pair from Vault and uses them to create an AWS instance:
```hcl
data "vault_kv_secret_v2" "ec2_ami" {
  mount = "ec2-sydney" #Replace with your secret engine mount path
  name  = "ec2-ami-ssh" #Replace with your secret path
}

resource "aws_instance" "my_instance" {
  ami           = data.vault_kv_secret_v2.ec2_ami.data["ami"] #ami is key here for which value is to be retrieved
  instance_type = "t2.micro"
  key_name      = data.vault_kv_secret_v2.ec2_ami.data["key"]
}
```
## Terraform Workflow

- **Sequence**: For Terraform commands like apply and destroy, access to Vault data is crucial. Delete provisioned infrastructure before Vault infrastructure.
- **Creation Order**: Setup Vault infrastructure, configure secrets, then create actual infrastructure using Vault.
- **Destruction Order**: First, destroy actual infrastructure, then Vault infrastructure. Remember, role ID and secret ID expire in 20 minutes.
- **Pre-Destroy Secret Export**: Export sensitive secrets from Vault before destruction. Use Terraform or Vault CLI to securely extract and store secrets.
- **Phased Destruction**: Execute terraform destroy for managed infrastructure to ensure proper termination of resources using Vault secrets.
- **Vault Destruction**: After confirming resource deletion, proceed with Vault destruction to clean up the environment.
- **Similarities to Remote Backends**: Similar to S3 or DynamoDB remote backends, destroying Vault infrastructure before actual infrastructure can lead to operational issues.


## Vault UI Interface:

- Roles: Found under 'access'.
- Policies: Located under 'policies'.
- Select AppRole under 'access'.
- HashiCorp Vault lacks UI functionality for role creation; CLI usage is required.


## Script Execution with Environment Variables
-  Environment variables set within a script might not persist in the parent shell due to subshell execution.
-  Use source to ensure the script runs in the current shell (e.g., source ./myscript.sh).

## Best Practices:
- Vault Agent: Securely injects secrets into app environments.
- Vault Leases: Ensure short-lived credentials for added security.
- Vault Audit: Track user activity and API calls for security audits.

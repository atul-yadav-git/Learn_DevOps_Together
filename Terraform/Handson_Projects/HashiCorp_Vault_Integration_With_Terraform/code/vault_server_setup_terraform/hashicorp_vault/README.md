#steps to run to configure hashicorp vault to store ssh key and ami for ec2 provisioning

once vault dev server is up and running

Set up the Vault CLI environment variables:
bash
Copy code
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root  # Use the root token generated when starting the Vault server
3. Log in to the Vault server using the root token:
bash
Copy code
vault login root
4. Enable the Key-Value (KV) secret engine:
bash
Copy code
vault secrets enable -path=secrets kv
This command enables the KV secret engine at the path secrets.

5. Store the EC2 AMI ID and SSH key pair as secrets in Vault:
bash
Copy code
vault kv put secrets/ec2-ami-ssh ami_id="your_ami_id" ssh_key="your_ssh_key"
Replace your_ami_id and your_ssh_key with the actual values of your EC2 AMI ID and SSH key pair.

Now, the EC2 AMI ID and SSH key pair are securely stored as secrets in Vault's KV secret engine at the path secrets/ec2-ami-ssh.

You can verify that the secrets are stored correctly by retrieving them:

bash
Copy code
vault kv get secrets/ec2-ami-ssh
That completes Step 1: Storing Secrets in Vault.


########

while configuring secrets, log into vault cli sysetm and then export vault add as per vault startup log and then do vault login enter root token better then setting vault token env varibale, and then run configure secrets script ; can manually check all woring fine and same role id and secret id to update in tfvars

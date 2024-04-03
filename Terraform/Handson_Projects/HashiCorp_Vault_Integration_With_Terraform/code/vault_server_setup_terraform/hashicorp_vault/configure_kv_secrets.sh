#!/bin/bash

# Absolute path to the output file
output_file="/home/ec2-user/approle_ids.txt"

# Enable KV secret engine for version2 on specified path mount point
vault secrets enable -path=ec2-sydney kv-v2 &>> "$output_file"

# Store EC2 AMI ID and SSH key pair
vault kv put ec2-sydney/ec2-ami-ssh ami="ami-07e1aeb90edb268a3" key="MyKeyPair" &>> "$output_file"

# Retrieve and display the stored secrets
vault kv get ec2-sydney/ec2-ami-ssh &>> "$output_file"

# List all secrets under the specified path
vault kv list ec2-sydney/ &>> "$output_file"

# Create a Vault policy
vault policy write terraform-policy terraform-policy.hcl &>> "$output_file"

# List all policies
vault policy list &>> "$output_file"

# View the contents of the terraform policy
vault policy read terraform-policy &>> "$output_file"

# Check which authentication methods are enabled
vault auth list &>> "$output_file"

# Enable AppRole authentication method if not already enabled
if ! vault auth list | grep -q "approle/"; then
    vault auth enable approle &>> "$output_file"
fi

# Create a Vault Role and associate it with the policy
vault write auth/approle/role/terraform-role \
  secret_id_ttl=10m \
  token_num_uses=10 \
  token_ttl=20m \
  token_max_ttl=30m \
  secret_id_num_uses=40 \
  token_policies=terraform-policy &>> "$output_file"

# Fetch the Role ID and Secret ID
role_id=$(vault read -field=role_id auth/approle/role/terraform-role/role-id)
secret_id=$(vault write -f -field=secret_id auth/approle/role/terraform-role/secret-id)

# Display Role ID and Secret ID
echo "Role ID: $role_id" &>> "$output_file"
echo "Secret ID: $secret_id" &>> "$output_file"


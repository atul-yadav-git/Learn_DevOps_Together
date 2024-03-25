# Managing AWS Key Pairs with Terraform

## Introduction

Terraform simplifies the management of AWS key pairs, allowing users to securely associate public keys with EC2 instances for SSH access. 

## Generating and Uploading Key Pairs

-  To manage AWS key pairs with Terraform, you first generate a private-public key pair locally using a tool like `ssh-keygen`.
-  The private key is securely stored on your system. Terraform never stores or touches the private key for security reasons.
-  After generating the key pair, you upload the public key to AWS using Terraform.
-  This creates an AWS key pair resource, associating the public key with your AWS account.

## Launching EC2 Instances with Terraform

-  When launching EC2 instances using Terraform, you specify the AWS key pair name in the `key_name` attribute of the `aws_instance` resource.
-  This ensures that the corresponding public key is associated with the instance, enabling SSH access.

## Summary of Understanding

### AWS CLI/SDK vs. Terraform Approach

#### CLI/SDK: `aws create key pair` command
- Tools generate both private and public keys.
- Users are provided with the private key.
- AWS retains the public key.
- No explicit provision of the public key when referencing key pairs.

#### Terraform:
- Focuses on managing public keys.
- Users provide the path to existing public key files.
- Terraform uploads public keys to AWS and associates them with created key pairs.

### Key Takeaways

- Both approaches offer advantages based on security needs, automation requirements, and workflow preferences.
- If maintaining a separate private key and automating key pair management within Terraform is preferred, the `aws_key_pair` resource is ideal.
- Alternatively, external creation of key pairs using CLI/SDK and referencing them in Terraform is a viable option.

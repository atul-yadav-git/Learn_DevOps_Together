# Learnings during Handson : Terraform Remote Statefile Backend Setup with S3 and DynamoDB

---

### Table of Contents
1. [Recommended Workflow](#recommended-workflow)
    - [Infrastructure Setup](#infrastructure-setup)
2. [Best Practices](#best-practices)
3. [Access Control List (ACL) Settings for S3 Bucket](#access-control-list-acl-settings-for-s3-bucket)
    - [Overview](#overview)
    - [Who Can Access](#who-can-access)
    - [Who Cannot Access](#who-cannot-access)
    - [Access Control Mechanism](#access-control-mechanism)
    - [Bucket Policy](#bucket-policy)
4. [Backend Configuration Considerations](#backend-configuration-considerations)
    - [Limitations](#limitations)
    - [Terraform Destroy](#terraform-destroy)
    - [Separate State Management](#separate-state-management)
    - [Separation Approaches](#separation-approaches)
5. [Statefile Migration and Management](#statefile-migration-and-management)
    - [Migration Steps](#migration-steps)
    - [Deleting S3 and DynamoDB](#deleting-s3-and-dynamodb)
    - [Other Migration Options](#other-migration-options)
6. [Additional Considerations](#additional-considerations)
    - [Multi-Region Deployment](#multi-region-deployment)
    - [Debugging and Logging](#debugging-and-logging)
    - [Terraform Commands](#terraform-commands)
    - [Project Structure Visualization](#project-structure-visualization)

---

## Recommended Workflow

### Infrastructure Setup
1. **Create Backend Resources:**
   - Create an S3 bucket and DynamoDB table manually or using Terraform.
2. **Configure Backend:**
   - Update `backend.tf` to point to the created S3 bucket and DynamoDB table.
3. **Provision Infrastructure:**
   - Use Terraform configuration files (`main.tf`) to provision infrastructure resources.

### Best Practices
- Enable versioning on the S3 bucket for state file recovery.
- Utilize workspaces in the Terraform backend for managing multiple environments.

## Access Control List (ACL) Settings for S3 Bucket

### Overview
- When ACLs are set to private, only the bucket owner and IAM users/roles with explicit access can access the bucket and its contents.

### Who Can Access
- Owner of the S3 Bucket
- IAM Users/Roles with Explicit Access

### Who Cannot Access
- Public
- Other AWS Accounts (unless explicitly granted access)

### Access Control Mechanism
- ACL Check
- Permissions Evaluation
- Resource-Level Policies (Optional)

### Bucket Policy
- Currently, ACLs are disabled, and a bucket policy is used for access control.
- Bucket policies provide fine-grained access control at the bucket level, aligned with AWS best practices.

## Backend Configuration Considerations

### Limitations
- Backend configuration does not support dynamic values like variables.
- Must be directly in the root directory, not within any module.

### Terraform Destroy
- By default, `terraform destroy` targets all resources managed by Terraform.

### Separate State Management
- Recommended approach to avoid destroying the backend while destroying infrastructure.

### Separation Approaches
- Workspaces
- Separate Backend Configuration Directory

## Statefile Migration and Management

### Migration Steps
- Update `backend.tf` for the desired backend configuration.
- Run `terraform init -migrate-state`.

### Deleting S3 and DynamoDB
- Ensure statefile migration from remote to local.
- Empty all objects in the S3 bucket.
- Run `terraform destroy`.

### Other Migration Options
- Use `terraform state pull` to move statefile between local and remote.

## Additional Considerations

### Multi-Region Deployment
- Advantages: Redundancy and better availability.
- Consideration: Natural disaster scenarios or failovers.

### Debugging and Logging
- Use `export TF_LOG=debug` for verbosity.
- Reset logging settings with `unset TF_LOG`.

### Terraform Commands
- Common commands: `terraform init`, `terraform refresh`, `terraform plan`, `terraform apply`.

### Project Structure Visualization
- Use the `tree` command in Terraform to visualize the project structure.


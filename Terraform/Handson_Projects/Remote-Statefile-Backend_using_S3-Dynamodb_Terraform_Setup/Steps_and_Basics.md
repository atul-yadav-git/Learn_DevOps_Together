# Remote Backend Setup using S3 and DynamoDB with Terraform

### Purpose:
The purpose of this project is to demonstrate how to set up a remote backend using AWS S3 and DynamoDB with Terraform, while maintaining a separation between backend configuration and infrastructure resources.

### Prerequisites:
- AWS account with appropriate permissions to create S3 buckets and DynamoDB tables.
- AWS CLI installed and configured
- Terraform installed locally.

### Concepts to be Learned:
- Remote backend configuration in Terraform using S3 and DynamoDB.
- Modularization of infrastructure code using Terraform modules.
- State management and state migration in Terraform.

---

### Using S3 and DynamoDB:
-  Locking Mechanism with DynamoDB:
      -  DynamoDB is used for state locking to ensure that only one person can modify the state at any given time.
      -  This prevents conflicts and ensures data integrity in a collaborative environment.
-  S3 for Remote Secure Storage:
      -  S3 provides a highly available and secure storage solution for storing the Terraform state file.
      -  Using S3 allows for remote collaboration and ensures that the state file is securely stored and accessible from anywhere.

---

## Steps to Follow for Execution:

1. **Directory Separation:**
    - Separate backend configuration from infrastructure configuration to avoid mixing them up.
    - This separation ensures that changes in infrastructure configuration do not impact backend resources or configuration.
    - Keep the statefile isolated from other infrastructure code to prevent accidental modifications.

2. **Execution Steps:**
```css
    - Clone the project code from the GitHub repository to your local system.
    - Navigate to the `remote_backend_statefile` directory.
      - Run `terraform init` to initialize Terraform.
      - Run `terraform apply` to create S3 bucket and DynamoDB table for storing Terraform state.
      - Once remote backend resources are created, update the `backend.tf` file in the root directory according to the values obtained from the previous step.
    - Go back to the root directory.
      - Run `terraform init` to initialize Terraform with the configured remote backend.
      - Run `terraform apply` to provision infrastructure resources defined in `main.tf`.
```
3. **Migration Between Local and Remote Backend:**
    - To migrate between local and remote backend:
        - Update the `backend.tf` file to point to either local or S3 backend configuration.
        - Run `terraform init -migrate-state`.
        - For S3 backend, ensure S3 bucket and DynamoDB table are created beforehand. Then point the backend to S3.
        - For local backend, simply update the `backend.tf` file and reinitialize Terraform.
        - To delete S3 bucket and DynamoDB table, ensure all objects in S3 bucket are deleted first.

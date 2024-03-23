# Provisioning a Free Tier EC2 Instance on Amazon Web Services (AWS)

## Introduction

EC2 instances are virtual machines running on AWS, and they are a common component of many infrastructure projects.

## Prerequisites

Ensure the following prerequisites are met before proceeding:

- Terraform installed.
- AWS CLI installed and configured with account credentials that allow resource creation.

## Write Configuration

1. Create a directory for your configuration:

    ```sh
    mkdir aws-ec2-terraform
    ```

2. Change into the directory:

    ```sh
    cd aws-ec2-terraform
    ```

3. Create a file to define your infrastructure:

    ```sh
    touch main.tf
    ```

4. Open `main.tf` in your text editor, paste the provided configuration, and save the file.

    > **Note:** Adjust the AMI ID if using a different region.

## Terraform Configuration Overview

### Terraform Block

The `terraform {}` block contains Terraform settings, including provider information and version constraints.

### Providers

The `provider` block configures the specified provider, such as AWS in this case.

### Resources

Use `resource` blocks to define infrastructure components. For EC2 instances, set arguments like AMI ID, instance type, and tags.

## Initializing and Formatting

1. Initialize the directory:

    ```sh
    terraform init
    ```

2. Format the configuration:

    ```sh
    terraform fmt
    ```

3. Validate the configuration:

    ```sh
    terraform validate
    ```

 4. Review Configuration

    Use the `terraform plan` command to view the planned changes before applying:

    ```sh
    terraform plan
    ```

 5. Apply Configuration
    ```sh
    terraform apply
    ```

*Tip: Adjust configurations if needed before applying.*

## Inspecting State
Use terraform show to inspect the current state:

```sh

terraform show
```
### Manually Managing State
Terraform provides advanced state management using the terraform state command:

##### List resources in the state:
```sh
terraform state list
```

---

## Common Issues
If encountering issues during apply:

-  Verify the region and AMI ID.
-  Ensure a default VPC exists in the correct region.
-  In case of success, visit the AWS EC2 console to find your new instance.

> **Note:** Protect your Terraform state file, consider remote storage in Terraform Cloud or Enterprise.

# Purpose

The purpose of this documentation is to outline the process of migrating existing infrastructure, consisting of EC2 instances and security groups, from manual management to Terraform for streamlined provisioning and management.

## Background

-  I have implemented a multi-region setup with EC2 instances and security groups in two regions: Sydney and Singapore.
-  Each region has one EC2 instance and one security group allowing SSH access to that instance.
-  In total, there are four resources that need to be migrated to Terraform for management.

## Initial Setup

There are two approaches to set up the initial resources for migration:
1. Manually create the resources in the AWS console and then migrate them to Terraform.
2. Utilize the directory `multi_region_ec2_deployment_with_terraform` under the hands-on project to provision resources and then migrate them to a new Terraform project directory.

---

## Steps to Migrate

### 1. Create a Terraform Project

Initialize a new Terraform project directory using `terraform init`.

### 2. Define Provider Configuration (main.tf)

Create a `main.tf` file and define the relevant cloud provider configuration, such as the AWS provider block.

### 3. Generate Resource Configuration

Utilize an import block in `main.tf` to retrieve resource code, avoiding manual extraction of resource configuration details.

```hcl
import {
  id = "i-0bff763a38a7bf9e8" #resource id 
  to = aws_instance.ec2-sydney #how you want to reference resource in Terraform
}
```
Use `terraform plan -generate-config-out=<filename>.tf` to generate a basic configuration block based on the existing resource (e.g., EC2 instance).

### 4. Import Resource Configuration (main.tf)

Copy the generated configuration block (or write it manually) into your `main.tf` file and comment out the import block now.

### 5. Import Resource

Use `terraform import <resource_type>.<resource_name> <resource_id>` to import the resource into Terraform's state. 
```bash
terraform import aws_instance.existing_instance i-0fedcba0987654321` #(Replace placeholders with actual values)
```

### 6. Verify Import

Run `terraform plan` to confirm that the resource is now tracked by Terraform.

---


> *Adapt the steps and commands to your specific cloud provider and resource types.*

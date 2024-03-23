# Multi-Region EC2 Deployment with Terraform

This project demonstrates the creation of AWS EC2 instances in multiple regions using Terraform's Infrastructure as Code (IaC) approach.

## Prerequisites

- Terraform installed
- AWS CLI installed and configured with proper credentials
- SSH key pair created and available in required regions


## What's Included

- **main.tf:** The main Terraform configuration file defining EC2 instances and security groups.
- **variables.tf:** Declaration of variables used in the project.
- **providers.tf:** Definition of AWS provider and required version.
- **outputs.tf:** Specification of output values for display.
- **terraform.tfvars:** Configuration variables for AWS regions, instance type, AMIs, and key pair.
- **terraform.tfstate:** The current state of your infrastructure.


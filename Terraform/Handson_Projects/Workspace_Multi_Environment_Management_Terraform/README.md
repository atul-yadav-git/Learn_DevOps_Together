# Terraform Workspace Project

This project showcases the utilization of Terraform workspaces for managing different environments within the same infrastructure configuration.

## Project Details

- **Functionality**: The project creates EC2 instances and corresponding security rules, attaching the security rules to the EC2 instances.
- **Purpose**: The project aims to demonstrate the usage of Terraform workspaces for managing different environments (e.g., production, development).
- **Workspace Management**: Instead of using the default `terraform.tfvars` file, custom `prod.tfvars` and `dr.tfvars` files are employed for the production and development environments, respectively.
- **Modularization**: The code is modularized using separate modules for EC2 instances and security groups. Inbound SSH (port 22) access and outbound internet access are configured within the security groups.


## Project Structure
```css
.
├── dr.tfvars
├── main.tf
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── security-group
│       ├── egress-rules
│       │   ├── main.tf
│       │   └── outputs.tf
│       └── ingress-rules
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
├── outputs.tf
├── prod.tfvars
├── providers.tf
├── README.md
├── terraform.tfstate.d
│   ├── dr
│   │   ├── terraform.tfstate
│   │   └── terraform.tfstate.backup
│   └── prod
│       ├── terraform.tfstate
│       └── terraform.tfstate.backup
└── variables.tf

```

## Additional Notes

- **Workspace Usage**: Terraform workspaces facilitate managing multiple environments within a single configuration, enabling efficient infrastructure management.
- **Reduced Configuration Duplication**: Utilizing workspaces reduces the need for duplicating entire configurations for different environments, enhancing code maintainability.

---
> This project serves as a practical demonstration of workspace usage in Terraform for managing multi-environment infrastructure configurations.

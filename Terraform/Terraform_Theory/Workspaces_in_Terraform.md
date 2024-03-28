# Terraform Workspaces

Workspaces are separate environments within Terraform projects for managing configurations independently.

---

### Table of Contents
1. [Purpose of Workspaces](#purpose-of-workspaces)
2. [Creation of Workspaces](#creation-of-workspaces)
3. [Usage of Workspaces](#usage-of-workspaces)
4. [Current Workspace Interpolation](#current-workspace-interpolation)


## Purpose of Workspaces
Terraform workspaces resolve the issue of managing multiple environments by allowing the reuse of a single Terraform project across various environments. 

- Terraform workspaces enable efficient resource provisioning and management across diverse environments within a single Terraform project.
- Environments like development, staging, and production can share the same Terraform project while maintaining separate configurations.
- Without workspaces, conflicts may arise when modifying resources across different environments due to a shared state file.
- Creating separate state files per environment ensures that infrastructure changes are isolated and specific to each environment.


## Creation of Workspaces
-  Terraform starts with a single, default workspace named `default` that you cannot delete. 
-  If you have not created a new workspace, you are using the default workspace in your Terraform working directory.

## Usage of Workspaces
-  When you run `terraform plan` in a new workspace, Terraform does not access existing resources in other workspaces.
-  These resources still physically exist, but you must switch workspaces to manage them.

## Current Workspace Interpolation
Within your Terraform configuration, you may include the name of the current workspace using the `${terraform.workspace}` interpolation sequence. This can be used anywhere interpolations are allowed.

- A popular use case is using the workspace name as part of naming or tagging behavior:

```hcl
resource "aws_instance" "example" {
  tags = {
    Name = "web - ${terraform.workspace}"
  }
}
```

# Terraform Modules: Passing Variables, Configuring Providers for Multi-Region Deployments, and Inter-Module Communication

### Table of Contents

- [Handling Variables in Terraform Modules](#handling-variables-in-terraform-modules- )
- [Variable Scoping and Resolution](#variable-scoping-and-resolution- )
- [Provider Configuration for Modules](#provider-configuration-for-modules- )
- [Using Values from One Module Resource in Another](#using-values-from-one-module-resource-in-another- )

## Handling Variables in Terraform Modules 🛠️

Terraform modules promote code reusability, but managing variables within them requires careful consideration. Here's a breakdown of key concepts:

### Two Approaches for Providing Values 🎚️

1. **Define Variables in Root Module (main.tf):** 
   Explicit declaration in the root module's `main.tf` for clear configuration and maintainability.

2. **Provide Values Directly in Module Block:**
   Suitable for one-off deployments with values specific to that module instance.

Reasons for These Approaches:
- **Maintainability & Reusability:** Defining variables in the root module promotes easier updates for all module instances.
- **Readability & Clarity:** Explicit definitions enhance understanding, especially for complex setups.
- **Flexibility:** Direct module block values allow customization for specific deployments.

Precedence: Terraform searches for values in this order:
1. **Module Call Arguments** (explicitly passed)
2. **Root Module Variables** (defined in `variables.tf` or `terraform.tfvars`)
3. **Module Variable Defaults** (if any)

### Terraform Variable Precedence Examples (AWS)

This example demonstrates how Terraform searches for variable values in different scenarios:

**Module:** `modules/ec2-instance`

**Module Variables (variables.tf):**

```hcl
variable "ami" {
  description = "AMI for the EC2 instance"
  default     = "ami-0deadbeef"  # Default value
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}
```
Root Module (main.tf):

```hcl
variable "root_ami" {
  description = "Root module AMI (optional)"
}

variable "root_instance_type" {
  description = "Root module instance type (optional)"
}

module "ec2_instance" {
  source         = "./modules/ec2-instance"

  # Example 1: Module Call Arguments (explicitly passed)
  ami           = "ami-1234abcd"  # Overrides all other values
  instance_type = "t2.micro"

  # Example 2: Root Module Variables
  # ami           = var.root_ami  # Uncomment to use root module variable
  # instance_type = var.root_instance_type  # Uncomment to use root module variable

  # Example 3: Module Variable Defaults
}
```
#### Explanation:

-  Module Call Arguments: If you explicitly provide values for `ami` and `instance_type` during the module call (commented out in this example), those values will take precedence.
-  Root Module Variables: If no module call arguments are provided, Terraform will search for variables named ami and instance_type in the root module's variables.tf file. If defined there (commented out in this example), those values will be used.
-  Module Variable Defaults: If no values are provided in either the module call arguments or the root module variables, Terraform will finally use the default value (ami-0deadbeef) defined in the module's variables.tf for the ami variable. The instance_type variable in this example doesn't have a default value, so it would remain undefined and require a value in one of the previous steps.

---

## Variable Scoping and Resolution 🔍

-  Module-Specific Variables: Variables defined within a module's `variables.tf` are local and not accessible outside.
-  Variable Definitions Needed: To use values from `terraform.tfvars`, Terraform searches for matching names in your configuration or module blocks. A variable definition (even without a value) is required for recognition.

---

## Provider Configuration for Modules in Multi-Region Setups 🌐

Specifying Region and Provider:
- When deploying resources in a specific region with multiple providers, include both region and provider attributes in your module blocks.
- Omitting provider while specifying region will default to the root configuration's settings, potentially causing unexpected behavior.

Best Practices:
- Leverage Existing Configuration: If the parent configuration's provider and region work for the module, use them.
- Explicit Definitions: Explicitly define both provider and region within the module for specific configurations.

---

## Using Values from One Module Resource in Another Module Resource 🔄

>**Challenge: Referencing Resources Across Modules**

Terraform restricts direct resource referencing across different modules.

>**Solution: Output Variables for Inter-Module Communication** 📤

1. **Declare Output Variables:**
   In the first module (e.g., `modules/security-group/main.tf`), define an output variable for the resource you want to reference (e.g., security group ID).

2. **Use the Output Variable:**
   In the second module (e.g., `modules/ec2/main.tf`), reference the output variable from the first module using its name.

Example:

```hcl
# modules/security-group/main.tf
output "security_group_id" {
  value = aws_security_group.inbound_access.id
}

# modules/ec2/main.tf
module "ec2_sydney" {
  # ... other arguments
  vpc_security_group_ids = [module.security-group_sydney.security_group_id]
}
```

# Terraform Variables 🌐

### Table of Contents

1. [Overview](#overview)
   1. [Terraform Variables Overview](#terrafrom-variables-overview)

2. [Input Variables](#input-variables-)
   1. [Variable Declaration Arguments](#variable-declaration-arguments)
   2. [Supported Type Keywords](#supported-type-keywords)
   3. [Default Values and Type Constraints](#default-values-and-type-constraints)
   4. [TFvars Files Purpose](#tfvars-files-purpose)
   5. [Usage Summary](#usage-summary)
   6. [Terraform Apply Command](#terraform-apply-command)
   7. [Sensitive Input Variables](#sensitive-input-variables)
   8. [Variables on the Command Line](#variables-on-the-command-line)
   9. [Variable Definition Precedence](#variable-definition-precedence)

3. [Output Variables](#output-variables)
   1. [Defining Output Variables](#defining-output-variables)
   2. [Sensitive Output](#sensitive-output)
   3. [Handling Sensitive Values](#handling-sensitive-values)

4. [Local Values](#local-values)
   1. [Locals Block](#locals-block)
   2. [Expressions](#expressions)
   3. [Judicious Use](#judicious-use)
   4. [Referencing Local Value](#referencing-local-value)
   5. [Scope Limitation](#scope-limitation)


---

### Overview

Variables in Terraform are crucial for parameterizing and sharing values within configurations and modules. They enhance dynamism, reusability, and flexibility in your Terraform projects.

# Input Variables 🔄

This variable block in Terraform declares input variables, specifying attributes like description, type, and providing an optional default value.

*General Syntax*
```hcl
variable "example_var" {
  description = "An example input variable"
  type        = string
  default     = "default_value"
}
````

In this example, "example_var" is the variable's name, with a human-readable description, a specified data type (string in this case), and an optional default value of "default_value."

*AWS Example*

```hcl

variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "us-west-2"
}
```

Similarly, in an AWS context, the variable "aws_region" is declared. It describes the AWS region for resource deployment, has a data type of string, and a default value set to "us-west-2."

## Variable Declaration Arguments 🧩
Key arguments such as default, type, description, validation, sensitive, and nullable offer flexibility and customization for input variable declarations.

*General Syntax*

```hcl

variable "example_var" {
  description = "An example input variable"
  type        = string
  default     = "default_value"
  validation {
    condition     = length(var.example_var) > 5
    error_message = "Input must be at least 6 characters long."
  }
  sensitive   = true
  nullable    = false
}
```

This example introduces various arguments within the variable block. It includes a validation rule stating that the input must be at least 6 characters long. It is marked as sensitive to hide its value, and it cannot be set as null within the module (nullable = false).

*AWS Example*

```hcl

variable "aws_access_key" {
  description = "AWS access key for authentication"
  type        = string
  validation {
    condition     = regex(var.aws_access_key, "^[A-Z0-9]{20}$")
    error_message = "Invalid AWS access key format."
  }
  sensitive   = true
  nullable    = false
}
```

In an AWS scenario, the variable "aws_access_key" is defined. It includes a validation rule using a regex to ensure the input follows a specific format. It is marked as sensitive for security reasons and cannot be set as null within the module.

## Supported Type Keywords 📚
Terraform supports various data types like string, number, bool, and complex types like list, set, map, and object.

*General Syntax*

```hcl

variable "example_var" {
  description = "An example input variable"
  type        = string
}
```

The type attribute in the variable block specifies the accepted value type for the variable. In this example, "example_var" is of type string, meaning it can accept string values.

*AWS Example*

```hcl

variable "aws_subnet_ids" {
  description = "List of AWS subnet IDs"
  type        = list(string)
}
```

For AWS, the variable "aws_subnet_ids" is declared as a list of strings (list(string)). This indicates that it accepts a list of AWS subnet IDs, ensuring type constraints for clarity and error prevention.

## Default Values and Type Constraints 📝
Default values make variables optional, and type constraints ensure clarity and provide informative error messages for type mismatches.

*General Syntax*

```hcl

variable "example_var" {
  description = "An example input variable"
  type        = string
  default     = "default_value"
}
```

The default attribute in the variable block provides an optional default value for the variable. If no explicit value is provided during usage, the default value "default_value" will be used.

*AWS Example*

```hcl

variable "aws_instance_type" {
  description = "AWS EC2 instance type"
  type        = string
  default     = "t2.micro"
}
```

In an AWS context, the variable "aws_instance_type" has a default value set to "t2.micro." If no specific instance type is provided, Terraform will use "t2.micro" as the default value.

## TFvars Files Purpose 🗂️
TFvars files separate configuration from code, store sensitive information securely, enhance reusability, and facilitate collaboration in teams.

*General Syntax*

```hcl

## input.tf
variable "example_var" {
  description = "An example input variable"
  type        = string
  default     = "default_value"
}

## terraform.tfvars
example_var = "<some value>"
```

TFvars files serve the purpose of separating configuration from code. In this example, "input.tf" contains the declaration of the variable "example_var," providing a structured way to define input variables.

*AWS Example*

```hcl

## input.tf
variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "default_region"
}

## terraform.tfvars
aws_region = "us-east-1"
```

In an AWS scenario, "input.tf" defines the variable "aws_region," and the corresponding "terraform.tfvars" file sets a specific value for this variable, allowing adaptability for different environments or teams.

## Usage Summary 🔄
Define input variables in Terraform code, create specific .tfvars files, and specify them during Terraform commands using the -var-file option.



This summarizes the general approach to using input variables in Terraform. It involves defining variables in the code, creating dedicated .tfvars files for specific values, and then referencing these files during Terraform commands for seamless configuration.


## Terraform Apply Command 🛠️
The terraform apply command reads values from .tfvars files, updating input variables accordingly, demonstrating practical application.

*General Syntax*

```bash

terraform apply -var-file="example.tfvars"
```

The terraform apply command is used to apply Terraform configurations. The -var-file option allows specifying a .tfvars file containing values for input variables, making the configuration process more dynamic.

*AWS Example*

```bash

terraform apply -var-file="aws_vars.tfvars"
```

In an AWS deployment, the same terraform apply command is used, but with an AWS-specific .tfvars file ("aws_vars.tfvars") containing AWS-related input variable values.

## Sensitive Input Variables 🔒
Variables can be marked as sensitive, preventing their values from appearing in the plan or apply output for enhanced security.

*General Syntax*

```hcl

variable "example_var" {
  type      = string
  sensitive = true
}
```

Marking a variable as sensitive (sensitive = true) prevents its value from appearing in the plan or apply output. This is crucial for handling sensitive information securely.

*AWS Example*

```hcl

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

```

In AWS, the variable "aws_secret_key" is marked as sensitive, ensuring that its value is not exposed in the Terraform plan or apply output for improved security.

## Variables on the Command Line 📝
Variables can be specified directly on the command line using the -var option. This provides flexibility in providing values during terraform plan and terraform apply commands without modifying configuration files.

*General Syntax*

```bash

terraform apply -var="example_var=value"
```

*AWS Example*

```bash

terraform apply -var="aws_region=us-west-1"
```

In an AWS scenario, the -var option is used on the command line to specify the value for the variable "aws_region" during the Terraform apply command.

## Variable Definition Precedence 🔄
Terraform follows a specific order for loading variables, with later sources taking precedence over earlier ones, providing a hierarchy for defining values.

Precedence Order:
```bash
Environment variables
The terraform.tfvars file, if present.
The terraform.tfvars.json file, if present.
Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
Any -var and -var-file options on the command line, in the order they are provided.
```

Terraform follows a specific order for loading variables, with later sources taking precedence over earlier ones. This hierarchy provides a structured way to define and override variable values based on different sources.

# Output Variables 📤
Variables declared using the output block in Terraform to expose values for use outside the module or configuration. They play a crucial role in communicating specific information to other parts of the infrastructure.

*AWS Example*

```hcl

output "aws_instance_id" {
  description = "AWS EC2 instance ID"
  value       = aws_instance.example.id
}
```

In an AWS context, an output variable named "aws_instance_id" is declared. It describes the EC2 instance ID and references the id attribute of an AWS instance named "example."

## Defining Output Variables
*General Syntax*

```hcl

output "example_output" {
  description = "An example output variable"
  value       = "output_value"
}
```

Output variables are defined using the output block, specifying a name, description, and value. The name helps identify the variable, the description provides context, and the value represents the actual information to be exposed.

*AWS Example*

```hcl

output "aws_instance_ip" {
  description = "Private IP address of AWS instance"
  value       = aws_instance.example.private_ip
}
```

In an AWS scenario, an output variable named "aws_instance_ip" is defined. It describes the private IP address of an AWS instance named "example" by referencing the private_ip attribute.

## Sensitive Output 🕶️
When an output is marked as sensitive (sensitive = true), its values are hidden in the CLI output during plan or apply operations, enhancing security by preventing sensitive information exposure.

*General Syntax*

```hcl

output "example_sensitive_output" {
  value       = "sensitive_value"
  sensitive   = true
}
```

Sensitive outputs are marked using the sensitive argument within the output block. This ensures that sensitive information, such as passwords or keys, is not displayed in the CLI output during plan or apply operations.

*AWS Example*

```hcl

output "aws_db_password" {
  value       = aws_db_instance.example.password
  sensitive   = true
}
```

In an AWS context, an output variable named "aws_db_password" is marked as sensitive, protecting the database password from being exposed in the plan or apply output.

## Handling Sensitive Values 🔐
Terraform handles sensitive values by redacting them in the CLI output, ensuring that sensitive information is not revealed during the plan or apply stages. Sensitive values are recorded in the state but are accessible only to those with state data access.


# Local Values 🔄
These are short names assigned to expressions in Terraform, declared within a locals block. They enhance code readability and maintainability by providing meaningful aliases for data used in configurations.

## Local Values
*General Syntax*

```hcl

locals {
  example_value = "some_expression"
}
```

Local values in Terraform provide meaningful aliases, enhancing code readability and maintainability. They are declared within a locals block, as exemplified by the "example_value."

*AWS Example*

```hcl

locals {
  aws_instance_type = "t2.micro"
}
```

In an AWS context, a local value named "aws_instance_type" is defined within a locals block, representing a specific instance type for flexibility in configurations.

## Locals Block 🧱
The locals block is a specific construct in Terraform where related local values are declared together. It serves as a container for organizing and managing these named expressions.

*General Syntax*

```hcl

locals {
  example_value = "some_expression"
}
```

The locals block in Terraform is where related local values are declared together. It acts as a container, facilitating the organization and management of named expressions like "example_value."

*AWS Example*

```hcl

locals {
  aws_region = "us-west-2"
}
```

In an AWS scenario, the locals block is utilized to declare a local value named "aws_region," consolidating related information, such as the desired AWS region.

## Expressions 🔄
Within local values, expressions are formulas or references that can manipulate or combine related data. They allow for dynamic and flexible handling of information within Terraform configurations.

*General Syntax*

```hcl

locals {
  example_expression = "some_value * 2"
}
```

Expressions within local values in Terraform involve formulas or references, allowing manipulation or combination of related data. The "example_expression" demonstrates a simple multiplication.

*AWS Example*

```hcl

locals {
  aws_instance_count = aws_instance.example.count
}
```

In an AWS context, an expression named "aws_instance_count" is defined within locals, referencing the count attribute of an AWS instance named "example."

## Judicious Use 🤔
Using local values judiciously implies a thoughtful and careful approach, especially when dealing with single values employed in multiple places. This consideration ensures adaptability to future changes.

## Referencing local value
When using local values in expressions, the syntax involves referencing them as local.<NAME>. This syntax ensures the proper utilization of the assigned short names.

*General Syntax*

```hcl

resource "example_resource" "example" {
  name = local.example_value
}
```

When using local values in expressions, referencing them follows the syntax local.<NAME>. In this example, the local value "example_value" is referenced within a resource configuration.

*AWS Example*

```hcl

resource "aws_instance" "example" {
  instance_type = local.aws_instance_type
}
```

In the AWS environment, referencing local values is demonstrated by using the syntax local.<NAME>. Here, the instance type is set based on the local value "aws_instance_type."

## Scope Limitation 🌐
Local values have a scope limitation, meaning they can only be accessed within the module where they are declared. This ensures a controlled and localized usage, preventing unintended interference with other modules.

# Expressions and Built-in-Functions
### Table of Contents

1. [Expressions](#-expressions)
2. [Literal Values](#-literal-values)
3. [Arithmetic Operations](#-arithmetic-operations)
4. [Conditional Evaluation](#-conditional-evaluation)
5. [Resource Attributes](#-resource-attributes)
6. [Expression Console](#-expression-console)
7. [Types and Values](#-types-and-values)
8. [String Literals](#-string-literals)
9. [Operators](#-operators)
10. [Function Calls](#-function-calls)
    - [Commonly Used Functions](#some-commonly-used-built-in-terraform-functions)


## 🔄 Expressions
-  Expressions help you define values for variables or resources in a more dynamic way. Instead of hardcoding a value, you can use expressions to calculate or derive it based on certain conditions or computations.
-  While they're not specifically for input variables, they are often used in conjunction with variables to create dynamic and adaptable configurations.

Example:

```hcl

variable "example_var" {
  count = var.condition ? 1 : 0
  value = var.condition ? "value_when_true" : "value_when_false"
}
```
The example demonstrates a variable, "example_var," whose count and value are determined by a conditional expression. If a specified condition (var.condition) is true, the count is set to 1, and the value is "value_when_true"; otherwise, the count is 0, and the value is "value_when_false."
## 📝 Literal Values
Literal Values in Terraform are fundamental expressions representing fixed values such as strings or numbers. They are the building blocks for more complex computations and configurations.

Example:

```hcl

variable "example_string" {
  type  = string
  value = "Hello, Terraform!"
}
```
Here, the literal value is a string "Hello, Terraform!" assigned to the variable "example_string."

## 🧮 Arithmetic Operations
Arithmetic Operations involve mathematical computations within Terraform expressions. This includes addition, subtraction, multiplication, and division, allowing for dynamic value calculations.

Example:

```hcl

variable "example_sum" {
  value = 5 + 3 * var.coefficient
}
```
The expression calculates the sum by adding 5 to the product of 3 and the variable "coefficient."

## 🌐 Conditional Evaluation
Conditional Evaluation in Terraform is akin to if-else conditions in programming. It enables the execution of different configurations based on specified conditions, adding adaptability to infrastructure.

Example:

```hcl

variable "example_condition" {
  value = var.is_production ? "production_config" : "development_config"
}
```
The example uses a conditional evaluation to assign different values to the variable "example_condition" based on whether the variable "is_production" is true or false.

##  🏭 Resource Attributes
Resource Attributes refer to references to data exported by resources in Terraform configurations. These attributes provide information about the state and properties of deployed resources.

Example:

```hcl

output "example_output" {
  value = aws_instance.example.id
}
```
The output references the "id" attribute of an AWS instance named "example." This showcases how resource attributes can be utilized to extract information from deployed resources.

## 💻 Expression Console
The Expression Console is a tool for interactively experimenting with Terraform expressions. It allows users to test and refine expressions without modifying the main configuration.

Example:

```bash

terraform console
```
Running this command opens the Expression Console for real-time experimentation with Terraform expressions.

## 📚 Types and Values
Types and Values documentation covers the various data types and literal syntaxes in Terraform expressions. It provides essential information for understanding how values are represented in configurations.

Example:

```hcl

variable "example_number" {
  type  = number
  value = 42
}
```
This expression defines a variable "example_number" with a numeric type and a fixed value of 42.

## 🔤 String Literals
String Literals involve syntaxes for representing and manipulating string values in Terraform expressions. This includes interpolation sequences and template directives.

Example:

```hcl

variable "example_string_interpolation" {
  value = "Hello, ${var.name}!"
}
```
Here, the expression uses string interpolation to incorporate the value of the variable "name" into the string.

## ➕ Operators
Operators in Terraform are symbols or words representing arithmetic, comparison, or logical operations within expressions. They are fundamental for constructing meaningful computations.

Example:

```hcl

variable "example_operator" {
  value = var.count > 5 ? "High" : "Low"
}
```
This expression utilizes the greater-than operator to determine whether the variable "count" is greater than 5.

## 🔄 Function Calls
Function Calls involve the syntax for invoking pre-defined functions within Terraform expressions. These functions provide additional capabilities and can be used to perform specific tasks.

Example:

```hcl

variable "example_function_call" {
  value = length(var.list_of_values)
}
```
The expression uses the length function to determine the number of elements in the variable "list_of_values."

### Some commonly used built-in Terraform functions:

> #### element Function

Example:
```hcl

variable "colors" {
  type    = list(string)
  default = ["red", "green", "blue"]
}

output "selected_color" {
  value = element(var.colors, 1)
}
```
Explanation:
Retrieves the element at the specified index (1 in this case) from the list "colors."
> #### concat Function

Example:
```hcl

variable "first_list" {
  type    = list(string)
  default = ["apple", "banana"]
}

variable "second_list" {
  type    = list(string)
  default = ["orange", "grape"]
}

output "combined_list" {
  value = concat(var.first_list, var.second_list)
}
```
Explanation:
Concatenates two lists, resulting in a single list containing elements from both "first_list" and "second_list."
> #### join Function

Example:
```hcl

variable "tags" {
  type    = list(string)
  default = ["tag1", "tag2", "tag3"]
}

output "tags_string" {
  value = join(", ", var.tags)
}
```
Explanation:
Joins elements of the list "tags" into a single string, separated by a comma and space.
> #### format Function

Example:
```hcl

variable "name" {
  type    = string
  default = "John"
}

output "formatted_greeting" {
  value = format("Hello, %s!", var.name)
}
```
Explanation:
Creates a formatted string by replacing %s with the value of the variable "name."

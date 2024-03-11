# Creating VM on Cloud Using Scripts/Automation (IaC)
## Introduction
```
In modern cloud infrastructure management, creating virtual machines (VMs) through scripts and automation, commonly known as Infrastructure as Code (IaC), has become a standard practice.
This approach replaces manual console interactions with cloud provider APIs, enhancing efficiency, reproducibility, and scalability.
```
## Cloud Provider APIs
Every major cloud provider offers its API set to handle requests for creating and managing resources. Notable tools include:
```
AWS CLI (Command Line Interface)
AWS CloudFormation (CFT)
AWS CDK (Cloud Development Kit)
Terraform (for multi-cloud infrastructure)
```
## Tools for IaC
```
AWS CLI (Scripting): Command line tool for AWS interactions.
AWS CDK and AWS CFT: Used for AWS IaC.
Terraform: Popular tool for multi-cloud IaC (e.g., AWS, Azure, GCP).
```
## PuTTY for SSH
```
PuTTY enables connecting to an AWS instance using its public IP address and private key.
After connection, various tasks like software upgrades and configurations can be performed.
```
## AWS CLI for Automation
```
- AWS CLI allows programmatic interaction with AWS services.
- Managing AWS resources, which is done through the AWS console, can be automated using AWS CLI commands.
- AWS CLI commands are platform-agnostic (Windows/Linux) after configuration.
- Configuration involves setting up AWS CLI on the local system.
```

## About AWS CLI
```
-  AWS CLI (Command Line Interface) is a tool provided by AWS. It allows users to interact with AWS services and resources through the command line.
-  When using AWS CLI, you are essentially interacting with the AWS API (Application Programming Interface).
-  AWS CLI translates your commands into API requests behind the scenes.
-  It communicates with AWS services over the internet to perform actions and retrieve information.
-  AWS CLI serves as a convenient interface, simplifying the process of making API requests.
-  Users can manage and interact with AWS resources using the AWS CLI without crafting manual HTTP requests
```
## Benefits
```
Implementing IaC methodologies streamlines cloud operations, enabling efficient resource management and automation of routine tasks.
```

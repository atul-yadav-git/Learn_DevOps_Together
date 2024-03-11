# Creating Virtual Machines on Cloud and Automation Techniques

## 1. Introduction to Virtual Machine Creation:
   - To create a virtual machine, make a request to a cloud provider, such as AWS or Azure, through their respective consoles.
   - End users log into the AWS or Azure console from personal laptops to request virtual machines (referred to as EC2 instances in AWS).

## 2. Cloud Provider Focus:
   - The process is the same for any cloud provider, but the focus in this context is on AWS and Azure.

## 3. Introduction to Automation in DevOps:
   - Automating virtual machine creation process leads to enhance efficiency in DevOps.

## 4. Automation Approaches:
   - Different ways to automate virtual machine creation are:
      - Using the AWS CLI (Command Line Interface).
      - Making direct API calls to the cloud provider's API using programming languages like Python (e.g., AWS API or Azure API) with libraries like boto3.
      - Utilizing AWS CloudFormation Templates (CFT) for structured resource creation.
      - Using terraform as a powerful infrastructure automation tool compatible with multiple cloud providers.

## 5. Interaction with Cloud Provider's API:
   - All automation approaches involve interacting with the cloud provider's API.
   - The API is developed by the cloud provider (e.g., AWS) to handle requests for creating resources.

## 6. Tools for Automation:
   - AWS-specific tools for infrastructure automation include AWS CLI, API, CFT, and AWS CDK (Cloud Development Kit).
   - Terraform is a popular tool for multi-cloud infrastructure automation, supporting AWS, Azure, and Google Cloud Platform.

## 7. Considerations for Choosing Automation Tools:
   - Emphasizes considering the specific needs and focus of the organization when choosing an automation tool.
   - If an organization primarily uses AWS, utilizing AWS-specific tools may be sufficient.

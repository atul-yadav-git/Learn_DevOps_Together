# Terraform: Automating Infrastructure Provisioning and Management

### Traditional Infrastructure Management 
```yaml
- Manual creation of cloud resources via UI can be tedious, especially for repetitive tasks.
- Programmatic approaches like scripts or APIs provided by cloud providers offer alternatives.
- Examples of cloud provider-specific IaC tools include AWS CloudFormation, Azure Resource Manager, and OpenStack Heat Templates.
```
## Why Terraform

```yaml
- Managing multiple IaC tools for different cloud providers can be complex.
- Terraform offers a universal approach using HCL (HashiCorp Configuration Language) to define infrastructure.
- Terraform translates HCL code into specific API calls for the chosen cloud provider using "infrastructure as code as code."
```
## Benefits of Terraform

```yaml
- Terraform simplifies infrastructure automation, eliminating the need to learn multiple IaC tools.
- It facilitates the creation of highly available and scalable infrastructure configurations.
```
## Alternatives to Terraform
```yaml
- While Terraform is popular, alternatives like Crossplane and Pulumi exist.
```
## How Terraform Works
```yaml
- Terraform utilizes "API as Code" to interact with cloud providers.
- Infrastructure is defined in HCL code, which Terraform translates into API calls for execution.
```

## Prerequisites
```yaml
- Cloud Provider Knowledge:
    -  A fundamental understanding of the chosen cloud provider (e.g., AWS, Azure, GCP) is crucial for effective Terraform usage.
    -  Familiarity with the provider's services, concepts, and best practices will enhance your Terraform workflows.
- Manual Understanding:
    - Before automating infrastructure with Terraform, it's essential to have a manual understanding of the processes involved.
    - This includes knowing how to perform tasks manually, understanding the requirements, and being familiar with any manual configurations that might be automated.
- CLI Access and Software Installation:
    - Ensure you have command-line interface (CLI) access set up with your chosen cloud provider (e.g., AWS CLI, Azure CLI, GCP Cloud Shell).
    - This includes appropriate credentials and tools configured for seamless interaction.
    - Have Terraform installed on your local machine following the official instructions for your operating system
```


## Key Terraform Commands
```yaml
- `terraform init`: Initialization of Terraform configuration.
- `terraform plan`: Dry-run of configuration to display planned actions.
- `terraform apply`: Application of configuration to create infrastructure resources.
- `terraform destroy`: To delete all resources

# Terraform state file for storing infrastructure information
```


*Note: Recommended to install HashiCorp Terraform and HashiCorp HCL plugins for code editor enhancements.*



# **Infrastructure as Code (IaC)**

### Table of Contents

  - [Introduction](#introduction)
  - [Need for IaC](#need-for-iac)
    - [The Challenge: Manual Infrastructure Deployment](#the-challenge-manual-infrastructure-deployment)
    - [The Solution: Infrastructure as Code (IaC)](#the-solution-infrastructure-as-code-iac)
  - [Benefits of IaC](#benefits-of-iac)
  - [API as Code in IaC](#api-as-code-in-iac)
  - [Provider-Specific IaC Tools](#provider-specific-iac-tools)
  - [The Need for Hybrid Cloud and Terraform](#the-need-for-hybrid-cloud-and-terraform)
  - [Terraform - A Hybrid Cloud Solution](#terraform---a-hybrid-cloud-solution)
  - [Benefits of Terraform](#benefits-of-terraform)
- [Why Companies use Hybrid Cloud and Multi Cloud models](#why-companies-use-hybrid-cloud-and-multi-cloud-models)
  - [Hybrid Cloud](#hybrid-cloud)
  - [Multi-Cloud](#multi-cloud)
- [How Terraform Leverages API as Code to Interact with Different Cloud Providers](#how-terraform-leverages-api-as-code-to-interact-with-different-cloud-providers)
  - [Declarative Configuration](#declarative-configuration)
  - [Providers Act as Adapters](#providers-act-as-adapters)
  - [Terraform Core Drives Automation](#terraform-core-drives-automation)
- [Benefits of API as Code with Terraform](#benefits-of-api-as-code-with-terraform)

---

## Introduction
-  Infrastructure as Code (IaC) is a methodology that involves managing and provisioning infrastructure resources through machine-readable configuration files or scripts.
-  IaC is a method of managing and provisioning IT infrastructure through code.

---

## Need for IaC
### The Challenge: Manual Infrastructure Deployment

-  Picture a scenario where a DevOps engineer is entrusted with deploying hundreds of applications.
-  These applications demand infrastructure, such as servers (think hundreds in this case), which can be deployed either on the cloud or on-premises.
-  The manual deployment of such extensive infrastructure is not only repetitive and time-consuming but is also error-prone.
-  Even minor mistakes can result in inconsistencies and deployment failures.

### The Solution: Infrastructure as Code (IaC)

-  Enter Infrastructure as Code (IaC), a transformative solution.
-  By coding the management of infrastructure resources, such as servers, IaC automates the deployment process.
-  This not only streamlines deployments but also enhances reliability.
-  Consequently, the DevOps engineer gains the freedom to concentrate on higher-level tasks, such as application development and troubleshooting.

---

### Benefits of IaC
- IaC eliminates repetitive, manual work by allowing the creation of scripts or configurations.
- Consistency is achieved as all resources are defined in code, reducing the risk of inconsistent environments.
- IaC provides scalability, control, and consistency to infrastructure management.

---

### API as Code in IaC
-  API as Code involves programmatically interacting with applications and services.
-  IaC leverages "API as code," where communication with the APIs of different cloud providers is utilized to create and manage resources.

---

## Provider-Specific IaC Tools
Different cloud providers have their native tools for IaC, such as  
```yaml
-  GCP: Google Cloud Deployment Manager (CDM) - YAML based
-  AWS: AWS CloudFormation Template, AWS CDK - YAML, JSON based
-  Azure: Azure Resource Manager - JSON
-  Terraform: Hybrid cloud - HashiCorp Configuration Language (HCL) based
-  OpenStack: Heat Templates
```
While each provider has its tools, Terraform emerges as a preferred choice for managing hybrid cloud environments.

---

## The Need for Hybrid Cloud and Terraform:
-  Say, DevOps engineer automates infrastructure provisioning using AWS CloudFormation templates.
-  However, when migrating to a different cloud provider like Azure, the engineer needs to rewrite the scripts due to incompatibility.
-  Similar challenges arise when transitioning to an on-premises infrastructure using OpenStack.
-  This highlights the limitations of cloud-specific IaC tools.
-  Terraform, a tool developed by HashiCorp, allows DevOps engineers to write infrastructure scripts using a declarative language, enabling automation across different cloud providers.

![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/c05eebe5-c105-4dc5-85b7-ed1deeb951e2)


## Terraform - A Hybrid Cloud Solution
-  Terraform is a tool that communicates with cloud provider APIs to provision and manage resources.
-  It abstracts the underlying APIs of different providers, making it an ideal choice for hybrid cloud scenarios.

## Benefits of Terraform
-  Ability to use a single tool to manage resources on multiple cloud providers.
-  Easier migration between cloud providers with minimal script changes.
-  Elimination of the need to learn multiple cloud-specific tools.

---

## Why Companies use Hybrid Cloud and Multi Cloud models

**Hybrid Cloud:**
```yaml
- Security and Compliance: Certain industries, like finance or healthcare, have strict data regulations. A hybrid cloud allows them to keep sensitive data on-premise while leveraging the public cloud for less critical workloads. This provides a balance between security and scalability.

- Existing Infrastructure Investment: Companies with significant investments in on-premises infrastructure can leverage a hybrid cloud to gradually migrate workloads to the cloud while still utilizing their existing hardware. This avoids the upfront cost of a complete cloud migration.

- Performance and Control: Latency-sensitive applications or those requiring granular control over resources might benefit from a hybrid cloud. Keeping these applications on-premise ensures optimal performance and direct control.
```
**Multi Cloud:**
```yaml
- Cost Optimization: By utilizing multiple cloud providers, companies can leverage the best pricing and services offered by each platform. They can choose the most cost-effective provider for specific workloads, leading to overall cost savings.

- Vendor Lock-In Avoidance: With a multi-cloud strategy, companies are not dependent on a single cloud provider. This frees them from potential vendor lock-in and allows them to switch providers based on their needs.

- Increased Availability and Disaster Recovery: Distributing workloads across multiple cloud providers enhances redundancy and disaster recovery capabilities. If one cloud provider experiences an outage, the others can continue functioning, minimizing downtime and ensuring business continuity.

- Access to Specialized Services: Different cloud providers offer unique services and features. A multi-cloud approach allows companies to choose the provider that excels in the specific service required for their application, maximizing functionality.
```
---

## How Terraform Leverages API as Code to Interact with Different Cloud Providers:
```yaml
1. Declarative Configuration:
   - Unlike traditional scripting tools, Terraform utilizes a declarative language called HashiCorp Configuration Language (HCL).
   - Instead of specifying step-by-step instructions, you define the desired state of your infrastructure (e.g., number of servers, storage size).
   - This approach allows Terraform to determine the necessary actions to achieve the desired state.

2. Providers Act as Adapters:
   - Terraform interacts with cloud providers through plugins called "providers."
   - Each provider acts as an adapter, translating Terraform's configuration language into the specific API calls required by the corresponding cloud provider (e.g., AWS, Azure, GCP).
   - These providers are written and maintained by HashiCorp or the community, offering a wide range of supported cloud platforms and services.

3. Terraform Core Drives Automation:
   - The Terraform core engine utilizes these provider plugins to interact with the cloud provider APIs.
   - Based on your configuration, it determines the necessary API calls to create, update, or destroy resources.
   - Terraform automates the entire process, eliminating the need for manual interaction with each cloud provider's console or API.
```
## Benefits of API as Code with Terraform:
```yaml
- Cloud Agnostic: By using providers, Terraform allows you to manage infrastructure across different cloud platforms with minimal code changes.

- Reduced Complexity: Terraform's declarative approach simplifies infrastructure management compared to scripting each step for each cloud provider.

- Improved Consistency: Defining infrastructure as code ensures consistent configurations across environments, reducing errors and simplifying deployments.
```

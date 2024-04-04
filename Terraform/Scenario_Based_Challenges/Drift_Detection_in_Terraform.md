# Drift Detection in Terraform
-  Drift detection is a crucial practice for maintaining consistent and controlled infrastructure managed by Terraform.
-  It involves identifying situations where the actual state of your infrastructure deviates from the configuration defined in your Terraform code.

---

### Table of Contents

- [Understanding Drift](#understanding-drift)
- [Terraform and Drift Detection](#terraform-and-drift-detection)
- [Techniques for Drift Detection](#techniques-for-drift-detection)
  - [Cron Job with Terraform Refresh and Plan](#cron-job-with-terraform-refresh-and-plan)
  - [Audit Logs and Lambda Functions](#audit-logs-and-lambda-functions)
- [Best Practices](#best-practices)
- [Conclusion](#conclusion)
- [Glossary](#glossary)

---

## Understanding Drift

-  Drift refers to a situation where the actual state of your infrastructure deviates from the configuration defined in your Terraform code.
-  This can occur due to manual changes made directly in the cloud console, human error, or external processes.

## Terraform and Drift Detection

Terraform offers tools to help identify and manage drift:

- **`Terraform Refresh`**: This command updates the Terraform state file, which stores information about the managed resources, to reflect their current state in the cloud provider.
- **`Terraform Plan`**: This command compares the desired state defined in your Terraform configuration files with the current state stored in the state file. Any discrepancies between the two indicate potential drift.

*Important Note:* While terraform refresh doesn't directly report changes, it's a crucial step. By updating the state file, it allows terraform plan to identify any inconsistencies caused by external changes.

## Techniques for Drift Detection

Here are two common approaches for drift detection:

1. **Cron Job with Terraform Refresh and Plan**:
   - Schedule a cron job to run terraform refresh followed by terraform plan periodically (e.g., hourly).
   - This ensures the state file is regularly updated, and any potential drift is detected during subsequent executions.

2. **Audit Logs and Lambda Functions**:
   - Configure cloud-provider audit logs to record changes made to resources managed by Terraform.
   - Implement Lambda functions to analyze these logs and identify unauthorized or unexpected modifications.
   - Set up notifications to alert the team about detected drift.

## Best Practices

- **Strict IAM Policies**: Enforce strict IAM policies to restrict manual modifications to infrastructure managed by Terraform.
- **State File Management**: Regularly back up your Terraform state file to facilitate recovery from accidental drift.
- **Third-Party Tools**: Consider using third-party tools that compare the Terraform state file with the actual cloud resources for a more detailed drift report.

## Conclusion

By combining these techniques and best practices, you can effectively detect and manage drift, ensuring your infrastructure remains consistent and controlled by Terraform.

---

## Glossary

- **Infrastructure as Code (IaC)**: Managing infrastructure through code instead of manual configuration.
- **Terraform**: An IaC tool for provisioning and managing cloud infrastructure.
- **Drift Detection**: Identifying when the actual state of your infrastructure differs from the configuration you defined in Terraform.
- **State File**: A file that stores the current state of your infrastructure as managed by Terraform.
- **Cron Job**: A tool for scheduling tasks to run automatically at defined intervals.
- **IAM (Identity and Access Management)**: A service for controlling access to AWS resources.
- **Lambda Function**: Serverless compute service that lets you run code without provisioning or managing servers.
- **Audit Logs**: Logs that record user activity and resource changes.

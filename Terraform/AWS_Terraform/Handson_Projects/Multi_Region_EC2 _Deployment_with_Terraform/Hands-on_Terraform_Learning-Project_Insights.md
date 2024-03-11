# Additional Learning: Terraform Hands-On

## Key Pair Setup for EC2 SSH

When working with EC2 instances in AWS, setting up a key pair is essential for secure SSH access. Here are the steps:

1. Create a key pair:
```bash
   aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
```
List existing key pairs:

```bash

aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName]' --output table
```
Delete a key pair:

```bash

aws ec2 delete-key-pair --key-name YourKeyName
```
EC2 key pairs are region-specific. To use the same SSH key pair across all AWS Regions, import the existing key pair to the desired region.

```bash

# Generate the public key from the private key
ssh-keygen -y -f path/to/your/private-key.pem > path/to/your/public-key.pub

# Import the key pair using the public key
aws ec2 import-key-pair --key-name AwsKey --public-key-material "$(cat path/to/your/public-key.pub)" --region <desired-region>
```
## Terraform Resource Modification and Recreation Behavior
Understanding how Terraform handles modifications and recreation of resources is crucial. Here are some key points:

-  Adding a tag doesn't recreate the resource; it's a basic modification.
-  Adding a security group is considered a modification.
-  Changing a VPC results in recreation; Terraform deletes and creates the resource.

## Default VPC and Security Group Behavior
When working with AWS, understanding the default VPC and security group behavior is important:

-  If a resource in Terraform doesn't explicitly define a region, it is created in the default configured region.
-  In a multi-region setup, if a resource is defined without specifying a provider, it defaults to the default provider, usually set to a specific region.

Default VPC:

-  When creating a VPC in AWS, it comes with a default security group named "default."
-  The default security group has rules allowing inbound traffic from resources within the same group but blocks external access, including SSH (port 22).

### Security Best Practices:
-  Create custom security groups for specific resources instead of relying on the default group.
-  For SSH access, create a separate security group allowing traffic only from specific sources.
-  Security groups are regional resources and can't be directly shared across regions.

### Benefits of Separate Security Groups per Region:
-  Regional Isolation: Separate security groups ensure that rules specific to a region don't affect other regions unintentionally.

-  Management Simplicity: Managing separate security groups simplifies configuration adjustments, avoiding conflicts between regions. Terraform handles regional context appropriately.

## Terraform Output and Show Commands
To view Terraform output values:

```bash

terraform output # Prints values specified in outputs.tf

terraform show   # View statefile; sensitive values are visible only to users with statefile access.

```




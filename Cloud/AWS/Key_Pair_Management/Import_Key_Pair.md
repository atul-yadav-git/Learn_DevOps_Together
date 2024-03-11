# AWS EC2 Key Pairs are Region Specific

To ensure secure access to EC2 instances in AWS, a key pair must be available during resource creation. This key pair is used for login verification. Follow the steps below for key pair management:

## 1. Create AWS Key Pair

Use the following command to create an AWS key pair named "MyKeyPair":

```bash
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
```
## 2. List Existing Key Pairs (Default Region)
To list existing key pairs in the default region, use:

```bash

aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName]' --output table
```
## 3. List Existing Key Pairs (Specific Region)
For a specific region, replace <your-region>:

```bash

aws ec2 describe-key-pairs --region <your-region> --query 'KeyPairs[*].[KeyName]' --output table
```
## 4. Delete a Key Pair
To delete a key pair, use the following command and replace "YourKeyName" with the name of the key pair you want to delete:

```bash

aws ec2 delete-key-pair --key-name YourKeyName
```
## 5. Key Points about EC2 Key Pairs
Amazon EC2 key pairs have the following characteristics:

 - Region Specific : 
When you create a key pair, it is specific to the AWS Region in which you generate it. This means the key pair is only available within that particular region.

 - Single Key Pair Across Regions : 
While key pairs are region-specific, you can use a single SSH key pair across all AWS Regions by importing your existing key pair (public key file) to the desired region.

# 6. Importing a Key Pair
To import a key pair, the private key must be available to get its public key, follow these steps:

## a. Generate the public key from the private key
```bash

ssh-keygen -y -f path/to/your/private-key.pem > path/to/your/public-key.pub
```
## b. Import the key pair using the public key
```bash

aws ec2 import-key-pair --key-name AwsKey --public-key-material "$(cat path/to/your/public-key.pub)" --region <desired-region>
```

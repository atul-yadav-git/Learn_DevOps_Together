
# AWS EC2 Key Pair Management

## Introduction
The `aws ec2 create-key-pair` command is utilized to generate a new key pair in Amazon EC2, consisting of a public key stored by AWS and a private key for local storage. 

This key pair is crucial for securely connecting to EC2 instances.

Command :`aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem`
### Command Output Example
```
{
  "KeyMaterial": "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEA...",
  "KeyName": "MyKeyPairName",
  "KeyFingerprint": "1f:51:ae:28:bf:89:e9:d8:1f:25:5d:37:2d:7d:b8:ca:9f:f5:fd:8f"
}
```
## Private Key Handling
After executing the command, save the private key securely on your local machine. 

Follow these steps:
```
Copy the private key material from the output.
Save the private key to a file on your local machine (e.g., MyKeyPairName.pem).
Set appropriate permissions: chmod 400 MyKeyPairName.pem
```
# Usage during EC2 Operations
## EC2 Instance Creation
Specify the key name during instance creation:

```
aws ec2 run-instances --key-name MyKeyPairName ...
```
## Connecting to an Instance
Use the private key file for SSH authentication:
```
ssh -i MyKeyPairName.pem ec2-user@<instance-public-ip>
```
## Public Key Association
```
The public key is automatically associated with the EC2 instance during launch. 

You don't need to handle it explicitly when using aws ec2 create-key-pair.
```
## Summary
```
Private key is saved locally and used for authentication.
Public key is managed by AWS during EC2 instance launch.
Securely manage key pairs to ensure authenticated connections.
```
## Listing Existing Key Pairs
### To list existing key pairs for default region:

```
aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName]' --output table
```
For Specific Region

```
aws ec2 describe-key-pairs --region <your-region> --query 'KeyPairs[*].[KeyName]' --output table
```
## To delete a key pair in AWS
```
aws ec2 delete-key-pair --key-name YourKeyName # Replace YourKeyName with the name of the key pair you want to delete.
```
Keep in mind that once a key pair is deleted, it cannot be recovered.
## Note:
```
The key pair generated using the aws ec2 create-key-pair command is primarily intended for use with Amazon EC2 instances. 

It provides a secure way to access and authenticate yourself to EC2 instances.

AWS uses key pairs in various services, but the key pair generated for EC2 instances is specifically designed for SSH access to those instances. It won't directly work with other AWS resources that might use different authentication mechanisms.

For other AWS resources, you might encounter different authentication methods. For example:

    Amazon S3: You typically use access keys (AWS access key ID and secret access key) for authentication.

    AWS Lambda: Authentication and authorization are often managed through AWS Identity and Access Management (IAM) roles and policies.

    Amazon RDS: Database instances often use username/password authentication.

Always refer to the documentation of the specific AWS service you are working with to understand and implement the correct authentication method. While the EC2 key pair is specific to EC2 instances, AWS provides a range of authentication mechanisms to suit the requirements of different services.
```

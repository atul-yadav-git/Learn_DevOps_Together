# **AWS Storage Management with S3 and EBS**


## **Choosing AWS Storage Services**

When deciding on AWS storage services, consider the following use cases:

### Amazon EBS (Elastic Block Store)

I choose EBS when:
- I need to add persistent storage volumes to specific EC2 instances.
- Low-latency access and persistent storage are essential for my application.

### Amazon EFS (Elastic File System)

I opt for EFS when:
- I want to share storage across multiple EC2 instances.
- A network file-sharing system is needed for scenarios where multiple EC2 instances require access to a common set of files.

### Amazon S3 (Simple Storage Service)

I prefer S3 for:
- Storing huge amounts of data, backups, and large files.
- Long-term access to data that doesn't necessarily need to be attached to a specific EC2 instance.
- Transfer charges and API calls for data retrieval from S3 are charged.

*Note: Each storage service has its strengths, and the choice depends on specific requirements and use-case scenarios.*

---
## AWS Free Tier Storage Options
-  EBS: 30GB
-  S3: 5GB
-  EFS: 5GB

---

## **S3 Bucket**

### To create an S3 bucket using AWS CLI, follow these steps:


```
aws s3api create-bucket --bucket <bucket-name> --region <region> --create-bucket-configuration LocationConstraint=<region>
```
*AWS CLI must be configured, for detail steps refer AWS_CLI_Setup.md*

-  Bucket names are unique identifiers. S3 bucket names must be globally unique across all AWS accounts.
-  Tagging in S3 using create-bucket command is not allowed.
-  `--create-bucket-configuration LocationConstraint=<region>` This flag is used to specify the region where the S3 bucket should be located. The value of <region> should match the AWS region specified in the --region flag. This is required because, when creating an S3 bucket, you need to provide a location constraint that indicates the region where the bucket will be created. It is usually set to the same region as specified in the --region flag.

Example :
```
aws s3api create-bucket --bucket my-unique-bucket --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2
```
This example creates an S3 bucket named my-unique-bucket in the us-west-2 regio

### Deletion of a bucket is done with:
```
aws s3 rb s3://your-bucket-name
```
S3 Bucket can only be deleted after emptying its content

*Note: S3 API calls, such as get and list, incur charges. Just Storing objects in S3 doesn't incur charges*

---

## **EC2 Volume and EBS Management**

EBS volumes in free tier have the following considerations:

-  I/O operations in the free tier: 2 million I/O operations.
-  Data transfer within the same region is free.
-  Charges apply beyond 30GB provisioned storage.
-  EBS volume types include general-purpose SSD and magnetic HDD.
-  Avoid enabling snapshots or encryption due to associated charges.

### Common EBS API Calls
```
CreateVolume: Creates a new EBS volume.
DeleteVolume: Deletes an EBS volume.
AttachVolume: Attaches an EBS volume to an EC2 instance.
DetachVolume: Detaches an EBS volume from an EC2 instance.
CreateSnapshot: Creates a snapshot of an EBS volume.
DeleteSnapshot: Deletes a snapshot of an EBS volume.
```
AWS CLI or AWS SDK can be used for EBS API calls.

*Note: In addition to API call charges, other EBS services may incur costs for storage and data transfer.*


### Default EBS Volume with EC2 Instance

- When creating an EC2 instance, the default EBS volume is attached as the root volume
- The EBS volume contains the OS and other data, serving as primary storage
- Terminating the EC2 instance also deletes the attached EBS volume

### Custom EBS Volume Attachment

- EC2 instances require storage for OS files
- Free tier Linux instances come with an 8GB default EBS storage, and Windows instances have a default 30GB EBS storage
- Attached volumes are part of the instance and get deleted on termination
- Separate EBS volumes can be created, attached, and customized for persistent data storage

### EBS Volume Attachment Process

1. Create EBS volume of required GB Storage, say of name 'ebs-volume'.
2. Select the volume and attach it to an AWS Linux instance
3. The attached volume might not immediately show up in `df -h`
4. Need to format it into filesystem and then mount it
5. Formatted the volume using `sudo mkfs -t ext4 /dev/xvdf`
6. Created a mount point with `sudo mkdir /data/ebs-volume`
7. Mounted the EBS volume to the mount point with `sudo mount /dev/xvdf /data/ebs-volume`
8. Verified visibility with `df -h`

### Ownership and Persistence

- Changed ownership of the mounted directory to `ec2-user` with `sudo chown ec2-user:ec2-user /data/ebs-volume/user/`
- Rebooting caused the mount point to disappear
- Added entries in `/etc/fstab` for persistence.
- Referenced official documentation for EBS volume modifications and best practices

Official Documentation:
- [AWS EC2 EBS Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html)
- [Requesting EBS Volume Modifications](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/requesting-ebs-volume-modifications.html)

---
**Note:** Increasing EBS volume size incurs charges, and size modifications are one-way; volume size can only be increased, not decreased.
---

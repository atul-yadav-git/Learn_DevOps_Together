# **EC2 Instance Management Through AWS CLI**
```
Guide on managing EC2 instances using the AWS CLI, covering:
  -  instance creation
  -  retrieval of essential details
  -  connecting to instance via ssh
  -  key pair management
  -  security group configuration
  -  instance termination.
```

*NOTE : This is post AWS CLI Setup*

## Creating EC2 Instance
- **Important parameters for instance creation: VPC, Subnet ID, Security Group, Key Pair, Instance Type, Image ID, Tags.**

  ```
  aws ec2 run-instances \
  --image-id <YourImageId> \
  --instance-type <YourInstanceType> \
  --key-name MyKeyPairName \
  --security-group-ids sg-12345678 \
  --subnet-id <YourSubnetId> \
  --count 1
  ```
### Obtaining EC2 Instance Type and Image ID
```
-  For aws instance type and image id, its best to confirm from AWS Console or other official AWS documentation.
-  As via AWS CLI there is no proper command to get this detail!
-  To get system of your requiremnets like free tier or with certain resources
```

### To get the AWS regions that are available to your account
```
aws ec2 describe-regions --query 'Regions[*].RegionName' --output table
```
### Listing Subnets, Availability Zones, and VPC for Default Region
```
aws ec2 describe-subnets --query 'Subnets[*].[SubnetId,VpcId,AvailabilityZone]' --output table
```
To list subnets for a specific region, you can use the --region option. 

For example:`aws ec2 describe-subnets --query 'Subnets[*].[SubnetId,VpcId,AvailabilityZone]' --output table --region us-west-2`

`aws configure list | grep region` To get the default region configured in your cli 

### To retrieve information about security groups in your AWS account. 
Security Group essentially operates as a firewall, with rules that determine what network traffic can enter and leave.
```
aws ec2 describe-security-groups --query 'SecurityGroups[*].[GroupId,GroupName]' --output table
```
This will retrieve information only for the default region configured in your AWS CLI

To get information for security groups across all regions available to your AWS account, you need to specify the --region parameter for each region.

For example : `aws ec2 describe-security-groups --region us-east-1 --query 'SecurityGroups[*].[GroupId,GroupName]' --output table`

## Key Pair Management
*Refer the file  EC2_Key_Pair_Management.md for complete steps and know how*
```
- Create a new key pair: `aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem`
- Save the private key securely on your local machine as .pem file and give permission as chmod 400
```
`aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName]' --output table` To list existing key pairs for default region:

# Command to Create AWS EC2 Instance in Free Tier
```
aws ec2 run-instances --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=<any name>}]' --image-id ami-07e1aeb90edb268a3 --count 1 --instance-type t2.micro --key-name <yourKeyName> --security-group-ids <security grp id> --subnet-id <subnet id>

```
*Note: key name should not have .pem*
## Retrieving All Important Details of an EC2 Instance

```
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`]|[0].Value,InstanceId,InstanceType,State.Name,KeyName,SecurityGroups[0].GroupName,Placement.AvailabilityZone,VpcId,SubnetId,PublicIpAddress,ImageId]' --output table
```
The resulting output is presented as a table, making it easier to view and understand the details of your EC2 instances, including their names (if available), IDs, types, states, and SSH key pair names.

### Command to get all imp details of a ec2 instance so that can connect to it!, but need to know instance id

```
aws ec2 describe-instances --instance-ids <YourInstanceID> --query 'Reservations[0].Instances[0].{PublicIP:PublicIpAddress,PublicDNS:PublicDnsName,PrivateIP:PrivateIpAddress,IPv6:NetworkInterfaces[0].Ipv6Addresses[0].Ipv6Address,KeyName:KeyName,UserName:Tags[?Key==`Username`]|[0].Value}'
```

`aws ec2 describe-tags --filters "Name=resource-id,Values=<YourInstanceID>"`

To check tags associated with a particular EC2 instance, get instance id from console or by describe instances command.

### Tagging an EC2 Instance

Use the following command to add a tag to an EC2 instance using its instance ID.

```
aws ec2 create-tags --resources <instance-id> --tags Key=Name,Value=<tag-value>
```

## Connecting to an EC2 Instance
Use the private key .pem file for SSH authentication:
```
ssh -i <MyKeyPairName>.pem ec2-user@<instance-public-ip-dns>
```

# Security Management
## EC2 CLI Commands for Modifying Inbound Traffic Rules and Public Access

Learn how to modify inbound traffic rules and enable public access for your EC2 instances using AWS CLI commands.

### Retrieve Security Group Information
Before making changes, obtain the security group associated with a specific EC2 instance.


```
aws ec2 describe-instances --instance-ids <your-instance-id> --query 'Reservations[*].Instances[*].[SecurityGroups]' --output text
```

### Authorize all incoming TCP traffic on port 80 from any IP address.


```
aws ec2 authorize-security-group-ingress --group-id <your-security-group-id> --protocol tcp --port 80 --cidr 0.0.0.0/0
````

### Revoke all incoming TCP traffic on port 80.


```
aws ec2 revoke-security-group-ingress --group-id <your-security-group-id> --protocol tcp --port 80 --cidr 0.0.0.0/0
```
### Allow traffic on port 80 only from specific public IP addresses.


```
aws ec2 authorize-security-group-ingress --group-id <your-security-group-id> --protocol tcp --port 80 --cidr 1.2.3.4/32
aws ec2 authorize-security-group-ingress --group-id <your-security-group-id> --protocol tcp --port 80 --cidr 5.6.7.8/32
```

### Get Rules in a Security Group
Retrieve information about all rules in a security group associated with a specific EC2 instance.

```
aws ec2 describe-security-groups --group-names <security-group-name>
```

### To get information about instances in a region other than the default, use the following command.

```
aws ec2 describe-instances --region us-west-2
```

### To check the default AWS CLI configured region, use the following command.


```
aws configure list
```

### Allow incoming traffic from a specified IP address to all ports and protocols.


```
aws ec2 authorize-security-group-ingress --group-id your-security-group-id --protocol all --cidr your-ip-address/32
```


### Security Considerations
```
Specify exact ports and IPs for added security. Limiting access based on specific IPs enhances the overall security posture.

Leverage AWS Identity and Access Management (IAM) for fine-grained control over access within your organization.
```
#### Default Region
Check the default AWS CLI configured region: `aws configure list`

## To terminate AWS EC2 Instance
```
aws ec2 terminate-instances --instance-ids <instanceid>
```
Its like delete, no more charges for it. 


# EC2 Instance Management Through AWS CLI (Windows)

## Creating EC2 Instance

```
aws ec2 run-instances \
--image-id ami-xxxxxxxxxxxxxxxxx \  # Windows AMI ID
--instance-type t2.micro \          # Free tier eligible instance type
--key-name MyKeyPairName \          # Key pair name
--security-group-ids sg-xxxxxxxxxxxxxxxxx \  # Security Group ID
--count 1 #to create one instance
```

## Obtaining EC2 Instance Details

### To get AWS Windows Image id and Instance Type
```
-  Recommended to check the AWS Management Console for a clearer understanding, as command outputs may not be as straightforward.
-  Free Tier AMI: Windows Server 2022 Base (ami-02ed1a17d1bd5f706)
-  Instance Type: t2.micro
```
`aws ec2 describe-regions --query 'Regions[*].RegionName' --output table` AWS Region Information 

`aws ec2 describe-subnets --query 'Subnets[*].[SubnetId,VpcId,AvailabilityZone]' --output table` Listing Subnets, Availability Zones, and VPC for Default Region 

`aws ec2 describe-subnets --query 'Subnets[*].[SubnetId,VpcId,AvailabilityZone]' --output table --region us-west-2` To list subnets for a specific region, use the --region option.

`aws configure list | grep region ` Get the default region configured in your CLI

`aws ec2 describe-security-groups --query 'SecurityGroups[*].[GroupId,GroupName]' --output table` Retrieving Security Group Information

`aws ec2 describe-security-groups --region us-east-1 --query 'SecurityGroups[*].[GroupId,GroupName]' --output table` To get information for security groups across all regions, specify the --region parameter for each region.

### Key Pair Management

Refer to the file EC2_Key_Pair_Management.md for complete steps and details.

-  `aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem` Create a new key pair 

- Save the private key securely on your local machine as .pem file and give permission as chmod 400

`aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName]' --output table` To list existing key pairs for default region

## To create free tier Windows EC2 Instance
```
aws ec2 run-instances --image-id ami-02ed1a17d1bd5f706 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-01b6d48ceea051932 --count 1 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyWindowsInstance}]'
```
Windows instance gets created with default 30 gb EBS storage as root volume.

Its minimum required for windows, can't go below it. Can have more size but not less then it.

# Connecting to Windows EC2 Instance (RDP)
```
For Windows instances, use Remote Desktop Protocol (RDP) instead of SSH.

Username: Administrator (can be confirmed in the console)

Password: Obtain from the console through the RDP connection setup. Will need private key used during instance creation

Ensure port 3389 is open in the security group for RDP.
```

## Getting details of Windows EC2 Instance
```
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`]|[0].Value,InstanceId,InstanceType,State.Name,KeyName,SecurityGroups[0].GroupName,Placement.AvailabilityZone,VpcId,SubnetId,PublicIpAddress,ImageId]' --output table
```
## Security Group Configuration

### Authorize RDP traffic (port 3389) from particular IP
```
aws ec2 authorize-security-group-ingress --group-id <your-security-group-id> --protocol tcp --port 3389 --cidr <your-ip-address>/32
```
### Authorize RDP traffic (port 3389) from all IP
```
aws ec2 authorize-security-group-ingress --group-id <YourSecurityGroupId> --protocol tcp --port 3389 --cidr 0.0.0.0/0
```

## Terminating EC2 Instance
```
aws ec2 terminate-instances --instance-ids <instance-id>
```
This command shuts down and then deletes the instance and its associated EBS storage.

*Note: Windows instances might take longer to initialize than their Linux counterparts.*

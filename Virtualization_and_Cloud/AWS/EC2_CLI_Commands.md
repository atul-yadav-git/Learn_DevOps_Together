*NOTE : This is post AWS CLI Setup*

## EC2 Instance Management

### Creating EC2 Instance
- Imp parameters for instance creation: VPC, Subnet ID, Security Group, Key Pair, Instance Type, Image ID, Tags.
```
-  For aws instance type and image id, its best to confirm from AWS Console or other official AWS documentation.
-  As via AWS CLI there is no proper command to get this detail!
-  To get system of your requiremnets like free tier or with certain resources
```

### To get the AWS regions that are available to your account
```
aws ec2 describe-regions --query 'Regions[*].RegionName' --output table
```
### Will list subnets and its availability zone and VPC for the default region configured in your AWS CLI
```
aws ec2 describe-subnets --query 'Subnets[*].[SubnetId,VpcId,AvailabilityZone]' --output table
```
to list subnets for a specific region, you can use the --region option. 

For example:`aws ec2 describe-subnets --query 'Subnets[*].[SubnetId,VpcId,AvailabilityZone]' --output table --region us-west-2`

to get the default region configured in your cli `aws configure list | grep region`

## To retrieve information about security groups in your AWS account.
```
aws ec2 describe-security-groups --query 'SecurityGroups[*].[GroupId,GroupName]' --output table
```
This will retrieve information only for the default region configured in your AWS CLI

To get information for security groups across all regions available to your AWS account, you need to specify the --region parameter for each region.

For example : `aws ec2 describe-security-groups --region us-east-1 --query 'SecurityGroups[*].[GroupId,GroupName]' --output table`

### command to create aws ec2 instance
```
aws ec2 run-instances --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-created}]' --image-id ami-0310483fb2b488153 --count 1 --instance-type t2.micro --key-name test --security-group-ids sg-08b131a6714d8ac46 --subnet-id subnet-041e2697f30213350

```
```
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`]|[0].Value,InstanceId,InstanceType,State.Name,KeyName]' --output table
```
### Key Pair Management
Create a new key pair: `aws ec2 create-key-pair --key-name MyKeyPairName`
Save the private key securely on your local machine.

### Retrieve all important details of an EC2 instance.

```
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`]|[0].Value,InstanceId,InstanceType,State.Name,KeyName,SecurityGroups[0].GroupName,Placement.AvailabilityZone,VpcId,SubnetId,PublicIpAddress,ImageId]' --output table
```
## Security Group Management
### Ingress Traffic Rules
Authorize and revoke ingress traffic rules.

```
aws ec2 authorize-security-group-ingress --group-id <your-security-group-id> --protocol tcp --port 80 --cidr 0.0.0.0/0
```
### Security Group Details
Get all rules in a security group of a particular EC2 instance.

```
aws ec2 describe-security-groups --group-names <security-group-name>
```
#### Default Region and Rule Opening
Check the default AWS CLI configured region: `aws configure list`

#### Authorize incoming traffic from a specified IP address to all ports and protocols.

```
aws ec2 authorize-security-group-ingress --group-id <your-security-group-id> --protocol all --cidr <your-ip-address>/32
```

*NOTE : This is post AWS CLI Setup*

## EC2 Instance Management

### Creating EC2 Instance
- Imp parameters for instance creation: VPC, Subnet ID, Security Group, Key Pair, Instance Type, Image ID, Tags.

  ```
  aws ec2 run-instances \
  --image-id <YourImageId> \
  --instance-type <YourInstanceType> \
  --key-name MyKeyPairName \
  --security-group-ids sg-12345678 \
  --subnet-id <YourSubnetId> \
  --count 1
  ```

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

```
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`]|[0].Value,InstanceId,InstanceType,State.Name,KeyName]' --output table
```
### Key Pair Management
*Refer the file  EC2_Key_Pair_Management.md for complete steps and know how*
```
Create a new key pair: `aws ec2 create-key-pair --key-name MyKeyPairName`
Save the private key securely on your local machine.
```
### command to create aws ec2 instance in free tier
```
aws ec2 run-instances --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=<any name>}]' --image-id ami-0310483fb2b488153 --count 1 --instance-type t2.micro --key-name <yourKeyName> --security-group-ids <security grp id> --subnet-id <subnet id>

```
### Retrieve all important details of an EC2 instance.

```
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`]|[0].Value,InstanceId,InstanceType,State.Name,KeyName,SecurityGroups[0].GroupName,Placement.AvailabilityZone,VpcId,SubnetId,PublicIpAddress,ImageId]' --output table
```
The resulting output is presented as a table, making it easier to view and understand the details of your EC2 instances, including their names (if available), IDs, types, states, and SSH key pair names.

`aws ec2 describe-tags --filters "Name=resource-id,Values=<YourInstanceID>"`

#command to check tags associated with ur particular ec2 instance, get instance id from console, or by describe instances

### Command to get all imp details of a ec2 instance so that can connect to it!, but need to know instance id

```
aws ec2 describe-instances --instance-ids <YourInstanceID> --query 'Reservations[0].Instances[0].{PublicIP:PublicIpAddress,PublicDNS:PublicDnsName,PrivateIP:PrivateIpAddress,IPv6:NetworkInterfaces[0].Ipv6Addresses[0].Ipv6Address,KeyName:KeyName,UserName:Tags[?Key==`Username`]|[0].Value}'
```

## Security Group Management
### Ingress Traffic Rules
First will need security grp of that ec2 instance to make changes

`aws ec2 describe-instances --instance-ids <your-instance-id> --query 'Reservations[*].Instances[*].[SecurityGroups]' --output text`
# get security grp of that partcilaur instance id

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
## To terminate AWS EC2 Instance
```
aws ec2 terminate-instances --instance-ids <instanceid>
```
Its like delete, no more charges for it. 


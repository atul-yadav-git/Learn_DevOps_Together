# AWS CLI commands for managing Amazon EBS volumes

## Volume Operations

### List and Describe EBS Volumes:

```
aws ec2 describe-volumes
```

Lists all EBS volumes in the AWS account along with their associated metadata.

## **Create EBS Volume:**

```
aws ec2 create-volume --availability-zone <availability-zone> --size <size-in-gb> --volume-type <volume-type>
```

Example : `aws ec2 create-volume --availability-zone us-east-1a --size 50 --volume-type gp2`

Creates a new EBS volume with the specified size and volume type in the specified availability zone.

### Get AWS Regions Available to Your Account:
```
aws ec2 describe-regions --query 'Regions[*].RegionName' --output table
```
### Get Availability Zones:
```
aws ec2 describe-availability-zones --region <region> --query 'AvailabilityZones[*].[ZoneName, State]' --output table
```
## **Attach EBS Volume to EC2 Instance:**

In AWS, when attaching an EBS volume to an EC2 instance, both the volume and the instance must be in the same availability zone.

```
aws ec2 attach-volume --volume-id <volume-id> --instance-id <instance-id> --device <device-name>
```
Example : `aws ec2 attach-volume --volume-id vol-0123456789abcdef0 --instance-id i-0123456789abcdef0 --device /dev/sdf`

Attaches an EBS volume to a specified EC2 instance and specifies the device name.

### The attached volume might need to be formatted and mounted onto EC2 instance.
---
*Note : This Steps are for Linux EC2 Instance*

---
For Linux EC2 Instance : SSH Login to system and then follow steps
```
$ df -h
$ sudo mkfs -t ext4 /dev/xvdf   # Formatting file system for new volume
$ sudo mkdir -p /data/ebs-volume   # Creating directory within subdirectory for mounting volume
$ sudo mount /dev/xvdf /data/ebs-volume   # Mounting the volume
```
To make the mounting persistent across reboots, you'll need to add an entry to the /etc/fstab file. Here's how you can do it:

Open the /etc/fstab file in a text editor. You can use a command-line text editor like nano or vi.
```
 sudo nano /etc/fstab
```
Add a new line at the end of the file to specify the mount point, device, file system type, and options. It might look like:
```
/dev/xvdf   /data/ebs-volume   ext4   defaults,nofail   0   2
```
`/dev/xvdf`: The device you want to mount.

`/data/ebs-volume`: The mount point you created.

`ext4`: The file system type. Adjust it based on the file system you used when creating the volume.

`defaults,nofai`: Mount options. nofail ensures that the system doesn't fail to boot if the volume is not present.

`0`: Used by dump, set to 0. `2`: Used by fsck, set to 2.

### To manually mount or unmount it using the mount and umount commands to test it without rebooting:
```
$ sudo mount -a     # Mount all entries in /etc/fstab
$ sudo umount /data/ebs-volume   # Unmount the volume
$ sudo mount /data/ebs-volume     # Mount the volume
```
This ensures that the configuration is correct and the volume is mountable. After confirming, you can reboot to check if it persists after a restart.

---
*Note : For Windows EC2 Instance follow official AWS Documentation*

---
## Detach EBS Volume from EC2 Instance:
```
aws ec2 detach-volume --volume-id <volume-id>
```

Detaches an EBS volume from the attached EC2 instance.

## Delete EBS Volume:
Volume can only be deleted if it's not attached to any EC2 instance.
```
aws ec2 delete-volume --volume-id <volume-id>
```

Deletes the specified EBS volume.

## **Volume Snapshot Operations**
### Create Snapshot of EBS Volume:
```
aws ec2 create-snapshot --volume-id <volume-id> --description <snapshot-description>
```

Creates a snapshot of the specified EBS volume.

### List EBS Snapshots:
```
aws ec2 describe-snapshots
```
Lists all EBS snapshots in the AWS account.

### Delete EBS Snapshot:
```
aws ec2 delete-snapshot --snapshot-id <snapshot-id>
```

Deletes the specified EBS snapshot.

## Additional Commands

### Add Name Tag to EBS Volume:
```
aws ec2 create-tags --resources <volume-id> --tags Key=Name,Value=<tag-name>
```
### View Only Your Own Snapshots:
```
aws ec2 describe-snapshots \
  --filters Name=visibility,Values=private \
  --filters Name=owner-id,Values=self
```
Without filter will also get list of AWS public community snapshots.

# Importance of Volume ID in EBS Commands
```
-  In AWS, the Volume ID plays a crucial role in executing commands related to Elastic Block Store (EBS).

-  For EBS commands, the Volume ID uniquely identifies a specific EBS volume and is required when performing various operations such as attaching, detaching, creating snapshots, or deleting volumes.

-  This identifier ensures that the command operates on the intended EBS volume within your AWS account.

-  Just as the Instance ID is crucial for EC2 instances, the Volume ID is equally important for EBS volumes when interacting with AWS services through the command line interface.
```

# AWS VPC (Virtual Private Cloud)

Note : **[AWS VPC Official Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario1.html)**

## 1. VPC Components

###  VPC (Virtual Private Cloud)
```
 A logically isolated section of the AWS Cloud where you can launch AWS resources. Think of it as your own private network within the vast AWS infrastructure.
```

###  Subnet
```
A smaller segment of a VPC with a specific IP address range, typically deployed in specific Availability Zones (AZs) for redundancy. A range of IP addresses in your VPC.
```

###  Security Group
```
 Acts as a virtual firewall for your instance to control inbound and outbound traffic, ensuring the security of your resources.
```

###  Route Table
```
 Defines how traffic is routed within your VPC and to the outside world. Contains a set of rules, called routes, that are used to determine where network traffic is directed.
```

### Internet Gateway
```
 Allows resources in your VPC to connect to the public internet and enables instances to access the internet.
```

###  Elastic IP
```
 A static IPv4 address designed for dynamic cloud computing.
```

## 2. Security Groups

###  Inbound/Outbound Traffic Rules
```
 Security groups act as firewalls, controlling inbound and outbound traffic based on defined rules
```
###  CIDR (Classless Interdomain Routing)
```
An efficient way to assign IPs, enhancing address space management.
```
###   Security Groups and Network ACL
```
Provide options to control who can access resources, enhancing security.
```

## Practical Example

Imagine deploying a web application with a public-facing web server and a private database server, creating a VPC with two subnets:

- Public Subnet: With an Internet Gateway for internet access.
- Private Subnet: Without an Internet Gateway, keeping resources secure within the private network.

## Hands-on for Security Groups

Allow SSH access to your web server instances from your company's IP address range (e.g., 10.0.0.0/16) and deny other inbound traffic:

1. Create a security group named "WebServer-SG."
2. Add an inbound rule allowing SSH traffic (port 22) from the source address "10.0.0.0/16."
3. Deny all other inbound traffic.

## Additional Tips

- Use descriptive names for better organization.
- Follow AWS security best practices, allowing the least privilege.
- Explore advanced features like Network Access Lists (ACLs) for granular control.

## VPC vs. VPN

A VPC is a private space, while a VPN is a secure connection to or between different networks, keeping data safe during transmission.

## Use Cases

### VPC
- Deploying a web application securely.
- Storing sensitive data in a private network.
- Running a database server in a highly available environment.

### VPN
- Allowing remote employees to access corporate resources.
- Connecting to a private network from public Wi-Fi.
- Bypassing geo-restrictions.


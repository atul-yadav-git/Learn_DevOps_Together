# Managing Route Tables and Security Groups in Custom AWS VPCs

## Route Tables in AWS VPC

### What is a Route Table?

A route table acts like a traffic map for your VPC. It defines how packets are routed to their target destinations.

### Importance of Route Tables

- By default, a VPC doesn't have internet access.
- A route table with a route to an internet gateway (IGW) enables instances in your VPC to reach the internet.
- Multiple route tables in a VPC allow control over traffic flow within the VPC and to the internet.

### Consequences of Not Having a Route Table

- Limited Functionality: Instances in public subnets won't have internet access.
- Isolation Issues: Communication between VPC instances and external resources becomes restricted.

### Inter-Subnet Communication

- Route tables direct traffic between subnets if direct connectivity through a common router is not available.
- Custom route tables are necessary for controlling routing to destinations outside the VPC.

## AWS Route Tables and Terraform

### Association of Subnets with Route Tables

- The `aws_route_table_association` resource associates a subnet with a specific route table.
- By default, every subnet in a VPC is associated with the main route table.

### Custom Routing Policies

- Custom route tables are used for traffic segmentation, defining specific routing policies, and ensuring multi-tenancy or isolation.
- Terraform allows explicit association of subnets with custom route tables.

## CIDR Blocks and Security Group Rules

### VPC and Subnet CIDR Blocks

- A VPC can have a single CIDR block, but it can be further divided into smaller, non-overlapping CIDR blocks for subnets.
- This allows for subnet creation with specific address ranges.
- VPC and subnet CIDR blocks expect single values, representing the entire address space for the VPC or subnet.

### Security Group Ingress Rules

- Security group rules allow specifying multiple CIDR blocks for inbound or outbound traffic control.
- These rules provide granular control over traffic flow.

## Understanding Security Groups and Egress Rules

### Internet Access and Egress Rules

- Egress rules control outbound traffic from instances to the internet or other resources.
- Adding an egress rule to a security group allows communication with the internet.

### Configuring Egress Rules

```hcl
egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"] // Allowing all outbound traffic
}
```
### Attaching Security Groups
Security groups with appropriate egress rules need to be attached to instances for internet communication.

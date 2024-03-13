# AWS Default VPC and Security Groups

## Default VPC

When you create a Virtual Private Cloud (VPC) in AWS, it automatically includes a default security group known as "default."

## Default Security Group Rules

The default security group comes with pre-configured rules:

- Inbound traffic is allowed from all resources within the same security group.
- All ports and protocols are open for communication between instances within the same group.
- Inbound traffic from the internet gateway or the NAT gateway is restricted, blocking access from the public internet, including port 22 (SSH).

## Security Best Practices

To enhance security and adhere to best practices:

- **Create Custom Security Groups:** It's advisable to create custom security groups tailored for specific resources or groups of resources. This allows you to define granular access rules based on your specific needs.

- **Separate Security Group for SSH Access:** For SSH access (port 22), it is recommended to create a separate security group. This group should only allow SSH traffic from specific sources, such as your IP address or a bastion host.

## Regional Aspects of Security Groups

- **Regional Resources:** Security groups in AWS are regional resources, confined to a specific region. They cannot be directly shared across different regions.

### Benefits of Separate Security Groups per Region

1. **Regional Isolation:** Security groups define inbound and outbound traffic rules. Having separate security groups ensures that rules specific to a region are isolated, preventing unintentional effects on other regions.

2. **Management Simplicity:** Defining separate security groups simplifies management. It avoids potential conflicts when adjusting rules in one region without affecting another.

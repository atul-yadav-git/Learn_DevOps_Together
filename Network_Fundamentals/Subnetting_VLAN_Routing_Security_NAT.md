# Subnetting

## 1. Introduction
Subnetting is the process of dividing a larger network into smaller, more manageable subnetworks called subnets. It facilitates efficient IP address allocation and enhances network organization.

## 2. Explanation
Subnetting involves dividing a network into smaller subnets by manipulating the network and host portions of the IP address. This process is typically done using a subnet mask, which determines the network and host portions.

## 3. Examples
For instance, with the IP range 192.168.0.0/24, you can create four subnets:
- Subnet 1: 192.168.0.0/26
- Subnet 2: 192.168.0.64/26
- Subnet 3: 192.168.0.128/26
- Subnet 4: 192.168.0.192/26
This allows better organization and control within an organization.

## 4. Syntax
Subnetting involves manipulating the subnet mask to create subnets, represented using dotted decimal or CIDR notation.

## 5. Key Bullet Points
- Subnetting divides a network for better management.
- Subnet mask manipulation is crucial.
- Efficient IP allocation is achieved through subnetting.

# VLANs (Virtual Local Area Networks)

## 1. Introduction
VLANs logically segment a physical network into multiple virtual networks, providing flexibility, security, and scalability.

## 2. Explanation
VLANs use switches and VLAN tagging to create virtual broadcast domains. Devices within the same VLAN can communicate as if connected physically, enhancing security and network performance.

## 3. Examples
In a business environment, VLANs can be used to separate departments, like finance, sales, and IT, improving communication and resource sharing.

## 4. Syntax
VLANs are configured on network switches, defining VLAN IDs, port memberships, and other settings.

## 5. Key Bullet Points
- VLANs logically segment networks based on criteria.
- Improved security, performance, and management are benefits.
- Switches and VLAN tagging are used in VLAN creation.

# Routing

## 1. Introduction
Routing is the process of forwarding network traffic between different networks, ensuring communication between devices.

## 2. Explanation
Routers use routing tables to decide the best path for data packets based on destination IP addresses, facilitating communication across networks.

## 3. Examples
When accessing a website on a remote server, routers determine the optimal path through the network to reach the destination.

## 4. Key Bullet Points
- Routing forwards data packets between networks.
- Routers maintain routing tables for optimal path selection.
- Routing protocols update routing tables for efficient packet delivery.

# Network Address Translation (NAT) Types

## 1. Introduction
Network Address Translation (NAT) translates IP addresses between different networks, enabling communication using a single public IP.

## 2. Explanation
- **Static NAT:** One-to-one mapping of private to public IP addresses.
- **Dynamic NAT:** Sharing a pool of public IPs among devices.
- **PAT (NAT Overload):** Maps multiple private IPs to a single public IP using unique port numbers.

## 3. Examples
For a small office with a single public IP, NAT allows configuring routers to translate private IPs to the public one.

## 4. Key Bullet Points
- NAT translates IP addresses across networks.
- Static NAT, Dynamic NAT, and PAT are types of NAT.
- NAT enables private network devices to access the internet.

# Network Security

## 1. Introduction
Network security protects computer networks from unauthorized access, misuse, or attacks, ensuring confidentiality, integrity, and availability.

## 2. Explanation
- **Firewalls:** Monitor and control network traffic based on predefined rules.
- **IDS/IPS:** Detect and prevent network attacks.
- **VPNs:** Establish secure connections over the internet.
- **Access Control:** Mechanisms like authentication and authorization.
- **Network Segmentation:** Dividing a network to limit the impact of breaches.

## 3. Examples
Implementing firewalls, IDS/IPS, VPNs, access control, and network segmentation contribute to network security.

## 4. Key Bullet Points
- Network security ensures protection against unauthorized access and attacks.
- Firewalls, IDS/IPS, VPNs, and access control are essential components.
- Network segmentation restricts the impact of breaches.

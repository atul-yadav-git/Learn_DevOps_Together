# Webpage Deployment using Provisioners and Custom VPC Setup and EC2 Deployment with Terraform

-  This project demonstrates the automated deployment of a custom Virtual Private Cloud (VPC) on AWS using Terraform. 
-  Provisioners are used to deploy web application on EC2 instance post creation to achieve zero-touch automation
-  It includes the creation of a custom VPC with a public subnet, internet gateway, route table, subnet-route-table association, and EC2 instance deployment within the VPC. 
-  Additionally, security group rules are implemented to control inbound and outbound traffic.


## Project Structure and Files Included:
```bash
.
├── main.tf
├── modules
│   ├── custom-vpc
│   │   ├── internet-gateway
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── route-table
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── subnet
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── subnet-route-table-association
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   └── vpc
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── security-group
│       ├── egress-rules
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       └── ingress-rules
│           ├── main.tf
│           ├── outputs.tf
│           ├── terraform.tfstate
│           └── variables.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── webpage
    ├── index.html
    ├── script.js
    ├── setup_nginx.sh
    └── style.css
```
## Additional Notes:
-  Provisioners are used for zero-touch automation, reducing manual efforts in deployment processes.
-  Terraform modules help organize and manage resources effectively.

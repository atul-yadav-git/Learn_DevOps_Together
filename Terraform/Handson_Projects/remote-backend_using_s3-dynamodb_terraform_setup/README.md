# Remote Backend Setup using S3 and DynamoDB with Terraform

-  This project demonstrates setting up a remote backend using AWS S3 and DynamoDB with Terraform. 
-  It includes a modular structure for managing infrastructure resources and backend configuration separately.

## Project Structure and Files Included:
```css
remote-backend_using_s3-dynamodb_terraform_setup/
├── backend.tf
├── main.tf
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── security-group/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── providers.tf
├── README.md
├── remote_backend_statefile/
│   ├── main.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── emptying_s3_bucket.sh
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
└── variables.tf
```

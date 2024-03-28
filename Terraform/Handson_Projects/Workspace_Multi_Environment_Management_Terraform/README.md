#basic workspace commands

terraform workspace show/list #for current workspace and list of available ones
terraform workspace new <workspacename> #to create and swithc to new workspace
terraform workspace select <workspacename> #to move to another workspace

# for terraform commands of apply, destroy, refresh, plan; need to specify custom tfvars file of that workspace for multi workspace environmnet

terraform apply -var-file=prof.tfvars #custom tfvars file
terraform refresh -var-file=prod.tfvars
terraform destroy -var-file=prod.tfvars
terraform plan -var-file=prod.tfvars

#this dont need tfvar file details
terraform fmt
terraform init
terraform validate
terraform output

#make sure never to give incorrect tfvars for that workspace, might have unintended consequences, always confirm the workspace we are working on and the variables we are passing to it

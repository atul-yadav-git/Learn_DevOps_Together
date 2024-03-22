# Steps to follow for execution

1. Directory separation is used to separate backend configurtaion from infrastructure configiguration
2. Any changes in infra configuration will not impact backend resources or configuration
3. Statefile is critical resource so its needs to be kept isolated from other infra code

## Execution Steps 

1. First go to remote_backend_statefile directory and do terrform init and apply
2. once remote backend resources are created s3 and dynamodb table, according to their values update backend.tf in root directory
3. Now do terraform init and apply in root directory it will initialize s3 remote backend and provision infra according to main.tf code

## to migarte between local and remote

1. Just make changes in backend.tf to either local or s3
2. terraform init -migrate-state
3. for s3, first make sure s3 and dynamodb are created and then point backend to s3 remote
4. for local, just make changes in backend.tf and reinit terraform, to delete s3 and dynamodb, s3 all objects must be deleted first

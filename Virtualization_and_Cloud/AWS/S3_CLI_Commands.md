# AWS CLI Commands for Amazon S3

The AWS CLI provides a variety of commands for interacting with Amazon S3. 

## Bucket Operations

List Buckets

  ```
  aws s3api list-buckets
  ```
Create Bucket

  ```
  aws s3api create-bucket --bucket <bucket-name> --region <region>
  ```
Delete Bucket
  
  ```
  aws s3api delete-bucket --bucket <bucket-name>
  ```
Get Bucket Location

  ```
  aws s3api get-bucket-location --bucket <bucket-name>
  ```
## Object Operations
Upload File to Bucket

  ```
  aws s3 cp <local-file-path> s3://<bucket-name>/<object-key>
  ```
Download File from Bucket

  ```
  aws s3 cp s3://<bucket-name>/<object-key> <local-file-path>
  ```
List Objects in Bucket

  ```
  aws s3 ls s3://<bucket-name>
  ```
Delete Object from Bucket

  ```
  aws s3 rm s3://<bucket-name>/<object-key>
  ```
Copy Object within/between Buckets

  ```
  aws s3 cp s3://<source-bucket>/<source-object-key> s3://<destination-bucket>/<destination-object-key>
  ```
## Other Operations
### Bucket Policy Operations
-  put-bucket-policy
-  get-bucket-policy
-  delete-bucket-policy

### Bucket Versioning
-  put-bucket-versioning
-  get-bucket-versioning

### Bucket ACL Operations
-  put-bucket-acl
-  get-bucket-acl

### Multipart Upload
-  create-multipart-upload
-  upload-part
-  complete-multipart-upload
### Presigned URLs
-  presign
  
---
**[Official AWS CLI Documentation for S3](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/index.html)**

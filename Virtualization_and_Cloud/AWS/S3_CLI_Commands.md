# AWS CLI Commands for Amazon S3

The AWS CLI provides a variety of commands for interacting with Amazon S3. 

## Bucket Operations

### List Buckets

  ```
  aws s3api list-buckets
  ```
This command lists all the S3 buckets in your AWS account. It provides information about each bucket, including the name and creation date.
### Create Bucket

  ```
  aws s3api create-bucket --bucket <bucket-name> --region <region>
  ```
This command creates a new S3 bucket. Replace <bucket-name> with a unique name for your bucket and <region> with the desired AWS region.
### Delete Bucket
  
  ```
  aws s3api delete-bucket --bucket <bucket-name>
  ```
This command deletes an empty S3 bucket. Replace <bucket-name> with the name of the bucket you want to delete. Buckets can only be deleted after its empty.
### Get Bucket Location

  ```
  aws s3api get-bucket-location --bucket <bucket-name>
  ```
This command will provide region where bucket is created.
## Object Operations
### Upload File to Bucket

  ```
  aws s3 cp <local-file-path> s3://<bucket-name>/<object-key>
  ```
This command uploads a file from your local machine to an S3 bucket. Replace <local-file-path> with the path to your local file, <bucket-name> with the bucket name, and <object-key> with the desired object key.
### Download File from Bucket

  ```
  aws s3 cp s3://<bucket-name>/<object-key> <local-file-path>
  ```
This command downloads a file from an S3 bucket to your local machine. Replace <bucket-name> with the bucket name, <object-key> with the object key, and <local-file-path> with the desired local destination.
### List Objects in Bucket

  ```
  aws s3 ls s3://<bucket-name>
  ```
This command lists all objects (files) in a specific S3 bucket. Replace <bucket-name> with the name of your S3 bucket.
### Delete Object from Bucket

  ```
  aws s3 rm s3://<bucket-name>/<object-key>
  ```
This command deletes a specific object (file) from an S3 bucket. Replace <bucket-name> with the bucket name and <object-key> with the object key.
### Copy Object within/between Buckets

  ```
  aws s3 cp s3://<source-bucket>/<source-object-key> s3://<destination-bucket>/<destination-object-key>
  ```
This command copies an object from a source S3 bucket to a destination S3 bucket. Replace <source-bucket>, <source-object-key>, <destination-bucket>, and <destination-object-key> accordingly.
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

# AWS CLI Commands for Amazon S3

The AWS CLI provides a variety of commands for interacting with Amazon S3. 

## AWS S3 Operations

1. [Create, List, and Delete Buckets](#create-list-and-delete-buckets)
2. [View Objects in Buckets](#view-objects-in-buckets)
3. [Change ACL Permissions](#change-acl-permissions)
4. [Copy or Move Objects to Buckets](#copy-or-move-objects-to-buckets)
5. [Delete and List Objects in Bucket](#delete-and-list-objects-in-bucket)


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
-  This command deletes an empty S3 bucket. Replace <bucket-name> with the name of the bucket you want to delete. 
-  Buckets can only be deleted after its empty. `aws s3 rm s3://your-bucket-name/ --recursive` To empty bucket at once.
### Get Bucket Location

  ```
  aws s3api get-bucket-location --bucket <bucket-name>
  ```
This command will provide region where bucket is located.

---

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

### Get Object Metadata

```
aws s3api head-object --bucket <bucket-name> --key <object-key>
```
This command retrieves metadata about a specific object in S3, providing details such as size, last modified date, and content type.

-  Example: `aws s3api head-object --bucket my-bucket --key uploads/my_file.txt`


### Set Object ACL (Access Control List)
*AWS CLI configured user must have necessary IAM permission to do this operations*
```
aws s3api put-object-acl --bucket <bucket-name> --key <object-key> --acl <policy>
```
This command allows you to control access to the object. Common ACL values include private, public-read, and bucket-owner-full-control.

-  Example: `aws s3api put-object-acl --bucket my-unique-bucket-8888 --key aws-console --acl public-read`

### Enable Website Hosting on a Bucket

```
aws s3 website s3://<bucket_name> --index-document <index_document> --error-document <error_document> (Optional)
```
This command enables serving website content directly from the S3 bucket, specifying index and error documents.

-  Example: `aws s3 website s3://my-website-bucket --index-document index.html --error-document error.html`

### Synchronize Files Between Local Directory and S3 Bucket

```
aws s3 sync <local_directory> s3://<bucket_name>/<prefix>
```
-  This command synchronizes a local directory with a specific S3 bucket prefix, uploading new files, updating existing ones, and deleting absent files in S3.
-  It doesn't delete file in bucket, if deleted in local directory, to do that have to use `--delete` in `aws sync` command.

Example: `aws s3 sync my_local_files s3://my-bucket/backups/`

### Upload Files with Encryption

```
aws s3 cp <file_path> s3://<bucket_name>/<object_name> --sse <encryption_algorithm>
```
This command uploads a file with encryption at rest in S3. Common encryption algorithms include AES256 and kms.

Example: `aws s3 cp confidential_data.txt s3://my-bucket/secure/data.txt --sse AES256`

---
## Understanding Object Names in Amazon S3

### Bucket Name:
- This is the globally unique name you choose for your S3 bucket.
- It must be unique across all existing bucket names in Amazon S3.

### Object Name (Object Key):
- This is the unique identifier for each object stored in the S3 bucket.
- It represents the full path to the object within the bucket.
- Example: If your object name/key is images/photo.jpg, the object is stored in a folder named images within the bucket, and its name is photo.jpg.

### Object Address (S3 URL):
The combination of the bucket name and object name/key forms the unique address (S3 URL) for accessing a specific object.
-  Example: If you have a bucket named my-example-bucket and an object name/key documents/report.pdf, the full S3 URL would be:
```
s3://my-example-bucket/documents/report.pdf
```
---


**[Official AWS CLI Documentation for S3](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/index.html)**

---

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

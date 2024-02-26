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
This command will provide region where bucket is located.
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


Get Object Metadata
Command:

bash
Copy code
aws s3 head-object s3://<bucket_name>/<object_name>
Explanation:
This command retrieves metadata about a specific object in S3, providing details such as size, last modified date, and content type.

Example:

bash
Copy code
$ aws s3 head-object s3://my-bucket/uploads/my_file.txt
ETag: "d6322f9145a82679349e924d..."
Content-Length: 12345
Content-Type: text/plain
Last-Modified: 2024-02-26T15:22:00Z
2. Set Object ACL (Access Control List)
Command:

bash
Copy code
aws s3 acl s3://<bucket_name>/<object_name> --acl <acl_value>
Explanation:
This command allows you to control access to the object. Common ACL values include private, public-read, and bucket-owner-full-control.

Example:

bash
Copy code
$ aws s3 acl s3://my-bucket/uploads/shared_file.txt --acl public-read
3. Enable Website Hosting on a Bucket
Command:

bash
Copy code
aws s3 website s3://<bucket_name> --index-document <index_document> --error-document <error_document> (Optional)
Explanation:
This command enables serving website content directly from the S3 bucket, specifying index and error documents.

Example:

bash
Copy code
$ aws s3 website s3://my-website-bucket --index-document index.html --error-document error.html
4. Synchronize Files Between Local Directory and S3 Bucket
Command:

bash
Copy code
aws s3 sync <local_directory> s3://<bucket_name>/<prefix>
Explanation:
This command synchronizes a local directory with a specific S3 bucket prefix, uploading new files, updating existing ones, and deleting absent files in S3.

Example:

bash
Copy code
$ aws s3 sync my_local_files s3://my-bucket/backups/
5. Upload Files with Encryption
Command:

bash
Copy code
aws s3 cp <file_path> s3://<bucket_name>/<object_name> --sse <encryption_algorithm>
Explanation:
This command uploads a file with encryption at rest in S3. Common encryption algorithms include AES256 and kms.

Example:

bash
Copy code
$ aws s3 cp confidential_data.txt s3://my-bucket/secure/data.txt --sse AES256

# Understanding Object Names in Amazon S3

In Amazon S3, the term "object name" is often used interchangeably with "object key." Both refer to the unique identifier assigned to each object (file or data) within a bucket. The object name, like the object key, serves as the path and name for the object within the bucket.

## Object Name Components:

### Bucket Name:
- This is the globally unique name you choose for your S3 bucket.
- It must be unique across all existing bucket names in Amazon S3.

### Object Name (Object Key):
- This is the unique identifier for each object stored in the S3 bucket.
- It represents the full path to the object within the bucket.
- Example: If your object name/key is images/photo.jpg, the object is stored in a folder named images within the bucket, and its name is photo.jpg.

## Object Address (S3 URL):
The combination of the bucket name and object name/key forms the unique address (S3 URL) for accessing a specific object.
Example: If you have a bucket named my-example-bucket and an object name/key documents/report.pdf, the full S3 URL would be:
```bash
s3://my-example-bucket/documents/report.pdf

  
---
**[Official AWS CLI Documentation for S3](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/index.html)**

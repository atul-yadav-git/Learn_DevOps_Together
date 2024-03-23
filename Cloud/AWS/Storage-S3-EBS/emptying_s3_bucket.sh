#!/bin/bash

echo "This script is use to empty bucket so it can be deleted, give bucket name to delete"
# Ask user for bucket name
read -p "Enter the bucket name: " bucket_name

# List objects in the bucket
echo "Listing objects in bucket '$bucket_name':"
aws s3 ls s3://$bucket_name

# Ask user for object key
read -p "Enter the object key to delete: " object_key

# List object versions
echo "Listing object versions for object '$object_key' in bucket '$bucket_name':"

aws s3api list-object-versions --bucket $bucket_name --prefix $object_key --query 'Versions[].VersionId'

versions=$(aws s3api list-object-versions --bucket $bucket_name --prefix $object_key --query 'Versions[].VersionId' --output text)

# Check if there are any versions
if [ -z "$versions" ]; then
    echo "No object versions found for object '$object_key' in bucket '$bucket_name'."
    exit 1
fi

# Ask user for confirmation to proceed
read -p "Are you sure you want to delete all versions and hidden files for object '$object_key' in bucket '$bucket_name'? (yes/no): " confirm

# Check user confirmation
if [ "$confirm" != "yes" ]; then
    echo "Aborted."
    exit 1
fi

# Loop through all versions and delete them
echo "Deleting all object versions for object '$object_key' in bucket '$bucket_name'..."
for version in $versions; do
    aws s3api delete-object --bucket $bucket_name --key $object_key --version-id $version
done

# Delete any delete markers
echo "Deleting delete markers for object '$object_key' in bucket '$bucket_name'..."
delete_markers=$(aws s3api list-object-versions --bucket $bucket_name --prefix $object_key --query 'DeleteMarkers[].{Key:Key,VersionId:VersionId}' --output json)

if [ ! -z "$delete_markers" ]; then
    for marker in $(echo $delete_markers | jq -r '.[] | @base64'); do
        _jq() {
            echo ${marker} | base64 --decode | jq -r ${1}
        }

        key=$(_jq '.Key')
        version_id=$(_jq '.VersionId')

        echo "Deleting delete marker for object '$key' with version ID '$version_id'..."
        aws s3api delete-object --bucket $bucket_name --key $key --version-id $version_id
    done
fi

# Remove all objects recursively
echo "Removing all objects recursively for object '$object_key' in bucket '$bucket_name'..."
aws s3 rm s3://$bucket_name --recursive # --exclude "*" --include "$object_key"

echo "Cleanup completed."


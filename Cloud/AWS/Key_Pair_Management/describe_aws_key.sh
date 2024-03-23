#!/bin/bash

# Script: describe_aws_key.sh
# Description: Print a list of available key pairs for different AWS regions in parallel.
# Requirements: Install 'parallel' on the system. For CentOS Stream 8, run:
#   sudo dnf install epel-release -y
#   sudo dnf install parallel -y

regions=("us-east-1" "us-east-2" "us-west-1" "us-west-2" "ap-south-1" "ap-northeast-2" "ap-southeast-1" "ap-southeast-2" "ap-northeast-1" "eu-central-1" "eu-west-1" "eu-west-2")

# Function to print key pairs for a given regions
print_key_pairs() {
    region=$1
    echo "Region: $region"
    aws ec2 describe-key-pairs --region $region --query 'KeyPairs[*].[KeyName]' --output table
    echo "-----------------------------"
}

export -f print_key_pairs

# Run in parallel for each region , for quick execution
parallel -j 6 print_key_pairs ::: "${regions[@]}"


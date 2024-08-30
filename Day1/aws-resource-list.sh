#!/bin/bash
# This code is for to get the the active list of AWS resources
# author: shanthiya

##################################################################

# following are the list of aws services supported
# EC2
# S3
# ELB
# ALB
# KMS
# Route53
# SNS
# RDS
# NLB
# IAM

# usage: ./aws-resource-list.sh <region> <service_name>
# Example: ./aws-resource-list.sh us-east-1 Ec2

#################################################################

# check if the required number of arguments are passed or not

if [ $# -ne 2 ]; then
  echo "Usage: $0 <region> <service_name>"
  exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$2


# Validate aws cli is installed or not

if ! command -v aws &> /dev/null; then
echo " AWS CLI is not installed. Please install and try again"
exit 1
fi

# Check if the aws cli is configured or not.

if [ ! -d ~/.aws ]; then
 echo "AWS CLI is not configured. Please configure it and try again"
 exit 1
fi

# List the resources based on the service

case $aws_service in
ec2)
     echo " listing the EC2 instance in $aws_region "
     aws ec2 describe-instance --region $aws_region
     ;;

s3)
    echo " Listing the S3 bucket in $aws_region"
    aws s3api list-buckets --region $aws_region
    ;;

*)
  echo "Invalid service. Please enter a valid service."
  exit 1
  ;;
esac 







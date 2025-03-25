#!/bin/bash

echo "Fetching AWS Resources..."
echo "=========================="

# Function to print section headers
print_section() {
    echo ""
    echo "================================="
    echo "$1"
    echo "================================="
}

# List all active AWS services with tagged resources
print_section "AWS Tagged Resources"
aws resourcegroupstaggingapi get-resources --output table

# List AWS Regions
print_section "AWS Regions"
aws ec2 describe-regions --output table

# List EC2 Instances
print_section "EC2 Instances"
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,Tags]" --output table

# List EC2 Security Groups
print_section "EC2 Security Groups"
aws ec2 describe-security-groups --output table

# List EC2 Volumes
print_section "EC2 Volumes"
aws ec2 describe-volumes --output table

# List S3 Buckets
print_section "S3 Buckets"
aws s3 ls

# List Lambda Functions
print_section "Lambda Functions"
aws lambda list-functions --output table

# List IAM Users
print_section "IAM Users"
aws iam list-users --output table

# List IAM Roles
print_section "IAM Roles"
aws iam list-roles --output table

# List IAM Policies
print_section "IAM Policies"
aws iam list-policies --output table

# List RDS Instances
print_section "RDS Databases"
aws rds describe-db-instances --output table

# List DynamoDB Tables
print_section "DynamoDB Tables"
aws dynamodb list-tables --output table

# List CloudFormation Stacks
print_section "CloudFormation Stacks"
aws cloudformation list-stacks --output table

# List ECS Clusters
print_section "ECS Clusters"
aws ecs list-clusters --output table

# List ECS Services (Modify for specific cluster)
print_section "ECS Services"
aws ecs list-services --cluster default 2>/dev/null || echo "No default cluster found"

# List EKS Clusters
print_section "EKS Clusters"
aws eks list-clusters --output table

# List CloudWatch Log Groups
print_section "CloudWatch Log Groups"
aws logs describe-log-groups --output table

echo ""
echo "AWS Resource Fetching Completed!"

#!/bin/bash

GROUP_NAME="devops-sg"
DESCRIPTION="DevOps Automation Security Group"
TAG="AutomationLab"

echo "Creating Security Group..."

SG_ID=$(aws ec2 create-security-group \
     --group-name $GROUP_NAME \
     --description "$DESCRIPTION" \
     --tag-specifications "ResourceType=security-group, Tags=[{Key=Project, Value=$TAG}]" \
     --query 'GroupId' \
     --output text)

echo "Security Group ID: $SG_ID"

echo "Adding SSH Rule..."

aws ec2 authorize-security-group-ingress \
    --group-id $SG_ID \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0

echo "Adding HTTP Rule..."

aws ec2 authorize-security-group-ingress \
    --group-id $SG_ID \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

echo "Security Group Rules Configured!"

aws ec2 describe-security-groups \
    --group-ids $SG_ID

#!/bin/bash

# Variables
KEY_NAME="automation-key"
INSTANCE_TYPE="t2.micro"
REGION="us-east-1"
TAG="AutomationLab"

echo "Creating EC2 Key Pair..."

aws ec2 delete-key-pair --key-name "$KEY_NAME" 2>/dev/null
rm -f "${KEY_NAME}.pem"
aws ec2 create-key-pair \
    --key-name "$KEY_NAME" \
    --query 'KeyMaterial' \
    --output text > "${KEY_NAME}.pem"

chmod 400 "${KEY_NAME}.pem"

echo "Launching EC2 Instance..."

INSTANCE_ID=$(aws ec2 run-instances \
              --image-id ami-0c02fb55956c7d316 \
              --instance-type "$INSTANCE_TYPE" \
              --key-name "$KEY_NAME" \
              --tag-specifications "ResourceType=instance, Tags=[{Key=Project,Value=$TAG}]" \
              --query 'Instances[0].InstanceId' \
              --output text)

echo "Waiting for instance to run..."

aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"

PUBLIC_IP=$(aws ec2 describe-instances \
     --instance-ids "$INSTANCE_ID" \
     --query 'Reservations[0].Instances[0].PublicIpAddress' \
     --output text)

echo "==================================="
echo "EC2 Instance Created Successfully!"
echo "Instance ID: $INSTANCE_ID"
echo "Public IP: $PUBLIC_IP"
echo "=================================="

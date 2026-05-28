#!/bin/bash

REGION="us-east-1"
BUCKET_NAME="automation-lab-$(date +%s)"
TAG="AutomationLab"

echo "Creating S3 Bucket..."

aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --region $REGION

echo "Enabling Bucket Versioning..."

aws s3api put-bucket-versioning \
    --bucket $BUCKET_NAME \
    --versioning-configuration Status=Enabled

echo "Creating Sample Files..."

echo "Welcome to AWS Automation Lab" > welcome.txt

echo "Uploading File..."

aws s3 cp welcome.txt s3://$BUCKET_NAME/

echo "S3 Bucket Created Successfully!"
echo "Bucket Name: $BUCKET_NAME"

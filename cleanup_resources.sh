#!/bin/bash

TAG="AutomationLab"

echo "Finding EC2 Instances..."

INSTANCE_IDS=$(aws ec2 describe-instances \
     --filters "Name=tag:Project,Values=$TAG" \
     --query 'Reservations[*].Instances[*].InstanceId' \
     --output text)

if [ ! -z "$INSTANCE_IDS" ]; then
    echo "Terminating EC2 Instances..."
    aws ec2 terminate-instances --instance-ids $INSTANCE_IDS
fi

echo "Finding Security Groups..."

SG_IDS=$(aws ec2 describe-security-groups \
   --filters "Name=tag:Project,Values=$TAG" \
   --query 'SecurityGroups[*].GroupId' \
   --output text)

for sg in $SG_IDS
do
   echo "Deleting Security Group: $sg"
   aws ec2 delete-security-group --group-id $sg
done

echo "Cleanup Completed!"

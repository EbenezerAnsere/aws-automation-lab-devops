# AWS Automation Lab

## Project Overview

This project automates the creation and management of AWS resources using Bash scripts and the AWS CLI.

The automation includes:

* EC2 Instance Creation
* Security Group Configuration
* S3 Bucket Creation
* Automated Cleanup of Resources

---

# Technologies Used

* Bash Scripting
* AWS CLI
* Amazon EC2
* Amazon S3
* IAM Permissions
* Git & GitHub

---

# Prerequisites

Before running the scripts, ensure you have:

* AWS Account
* AWS CLI installed
* IAM user with appropriate permissions
* Configured AWS credentials

---

# AWS CLI Setup

## Install AWS CLI

```bash
sudo apt update
sudo apt install awscli -y
```

## Configure AWS CLI

```bash
aws configure
```

Provide:

* AWS Access Key
* AWS Secret Key
* Default Region
* Output Format

---

# Verify AWS Configuration

```bash
aws sts get-caller-identity
aws configure list
```

---

# Scripts Overview

| Script                   | Purpose                                |
| ------------------------ | -------------------------------------- |
| create_ec2.sh            | Creates EC2 instance and key pair      |
| create_security_group.sh | Creates security group and opens ports |
| create_s3_bucket.sh      | Creates S3 bucket and uploads file     |
| cleanup_resources.sh     | Deletes created AWS resources          |

---

# Running the Scripts

## Make Scripts Executable

```bash
chmod +x *.sh
```

## Run EC2 Script

```bash
./create_ec2.sh
```

## Run Security Group Script

```bash
./create_security_group.sh
```

## Run S3 Script

```bash
./create_s3_bucket.sh
```

## Cleanup Resources

```bash
./cleanup_resources.sh
```

---

# Security Considerations

* Never upload AWS credentials to GitHub.
* Use IAM least privilege principles.
* Restrict SSH access to your IP when possible.
* Delete unused AWS resources to avoid charges.

---

# Challenges Faced

## Challenge 1

Managing unique S3 bucket names because bucket names must be globally unique.

### Solution

Used timestamps to generate unique bucket names dynamically.

---

## Challenge 2

Handling AWS CLI permission issues.

### Solution

Configured IAM permissions properly and verified credentials using:

```bash
aws sts get-caller-identity
```

---

# Screenshots

Include screenshots showing:

* AWS CLI configuration
* EC2 instance creation
* Security group creation
* S3 bucket creation
* Successful cleanup

Ensure:

* Full screen is visible
* Date and time are visible

---

# Author

**Ebenezer Ansere**

QA Engineer | DevOps Enthusiast

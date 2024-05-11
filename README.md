# Terraform AWS Infrastructure Deployment
https://miro.medium.com/v2/resize:fit:1400/format:webp/1*cHEsVNAzQvoXPy4VrExKJA.gif

This repository contains Terraform code to deploy infrastructure on AWS using a backend of an S3 bucket. All resources are organized into modules, and all configuration arguments are defined as variables for ease of use and adaptability.

## Overview

The Terraform scripts in this repository are designed to deploy various AWS resources, such as EC2 instances, VPC, subnets, security groups, etc., using best practices and modularity.

## Prerequisites

Before running the Terraform scripts, ensure you have the following prerequisites:

- Terraform installed on your local machine. You can download it from [Terraform Downloads](https://www.terraform.io/downloads.html).
- AWS account credentials configured on your local machine. You can set up credentials using the AWS CLI or by setting environment variables.
- Access to an S3 bucket to store Terraform state files.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone <repository-url>
Navigate to the cloned repository directory:


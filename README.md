# Terraform AWS Infrastructure Deployment
![Terraform Deployment](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*cHEsVNAzQvoXPy4VrExKJA.gif)


This repository contains Terraform code to deploy infrastructure on AWS using a backend of an S3 bucket and dynmodb for state locking. All resources are organized into modules, and all configuration arguments are defined as variables for ease of use and adaptability.

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
   
2.Navigate to the cloned repository directory:

    ```bash
   cd Terraform-deployment

3.Initialize Terraform and configure the backend:

       ```bash
   terraform init

4.Modify the terraform.tfvars file to customize the deployment settings according to your requirements.

5.Review the main Terraform files (main.tf) and adjust the configurations or modules as needed.

6.Plan the Terraform deployment to preview the changes:
   
   ```bash
   terraform plan

7.Apply the Terraform changes to deploy the infrastructure:
    ```bash
   terraform apply

8.Confirm the deployment by reviewing the Terraform output.
   

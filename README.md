Terraform VPC Module

This repository contains a reusable Terraform module to create a basic AWS VPC setup. It’s designed to keep things simple and easy to understand while still being practical for real-world use.

📌 What this module does

This module helps you create:

A VPC
Public and private subnets
Internet Gateway
Route tables and associations
(Optional) NAT Gateway for private subnet internet access

The idea is to give you a clean starting point for building infrastructure on AWS.

⚙️ Prerequisites

Before using this module, make sure you have:

Terraform installed 
An AWS account
AWS CLI configured (aws configure)
Proper IAM permissions to create VPC resources

🚀 How to use this module

You can call this module from your Terraform project like this:

module "vpc" {
  source = "git::https://github.com/rajamohanreddy-vaka/terraform-vpc-module.git"

  project_name     = "my-project"
  environment      = "dev"
  vpc_cidr         = "10.0.0.0/16"

  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.10.0/24", "10.0.11.0/24"]
  database_subnets = ["10.0.20.0/24", "10.0.21.0/24"]

  availability_zones = ["us-east-1a", "us-east-1b"]

  enable_nat_gateway = true
}
🧾 Input Variables

Here are the main variables you need to provide:

Variable Name	Description	Example
project_name	Name of your project	"my-project"
environment	Environment (dev/stage/prod)	"dev"
vpc_cidr	CIDR block for the VPC	"10.0.0.0/16"
public_subnets	List of public subnet CIDRs	["10.0.1.0/24, 10.0.2.0/24"]
private_subnets  List of private_subnet CIDRs ["10.0.10.0/24", "10.0.11.0/24"]
database_subnets List of database_subnet CIDRs ["10.0.20.0/24", "10.0.21.0/24"]
availability_zones	AZs for subnets	["us-east-1a"]
enable_nat_gateway	Whether to create NAT Gateway	true/false

📤 Outputs

After running this module, you’ll get outputs like:

VPC ID
Subnet IDs (public & private)
Route table IDs

These outputs can be used in other modules (like EC2, ALB, ECS, etc.)

💡 Notes:

NAT Gateway will incur cost if enabled
Make sure your subnet CIDRs don’t overlap
Use proper naming for project_name and environment to keep resources organized
🧠 Why this module?

This module is built as part of learning and practicing Terraform and AWS networking concepts. It focuses on:

Simplicity
Reusability
Real-world structure
📬 Feedback

If you have suggestions or improvements, feel free to raise an issue or contribute.

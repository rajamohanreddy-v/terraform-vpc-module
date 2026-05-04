<img width="1998" height="1700" alt="image" src="https://github.com/user-attachments/assets/e0b51858-895c-4eff-8d49-75c159819890" />**Terraform VPC Module**

A reusable Terraform module to provision an AWS VPC with public, private, and database subnets, along with required networking components like Internet Gateway, NAT Gateway, and route tables.

This module is designed to follow a practical structure used in real-world environments.

---

**Usage**

module "vpc" {
  source = "git::https://github.com/rajamohanreddy-vaka/terraform-aws-vpc.git?ref=main"

  project     = "roboshop"
  environment = "dev"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.11.0/24", "10.0.12.0/24"]
  database_subnet_cidrs = ["10.0.21.0/24", "10.0.22.0/24"]

  is_peering_required = false
}

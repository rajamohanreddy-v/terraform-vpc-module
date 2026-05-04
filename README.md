# Terraform-vpc-Module

A reusable Terraform module to provision an AWS VPC with public, private, and database subnet tiers, along with core networking components such as Internet Gateway, NAT Gateway, and route tables.

This module follows a practical structure used in real-world environments and is designed to be simple, reusable, and easy to extend.

---

## Usage

```hcl
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

```

 ## Features

- Creates a VPC with configurable CIDR block and DNS support
-	Supports public, private, and database subnet tiers
-	Internet Gateway for public subnet access
-	NAT Gateway with Elastic IP for outbound access from private subnets
-	Separate route tables for each subnet tier
-	Optional VPC peering support
-	Consistent tagging across all resources

---
```
```

## Resources Created

| Name | Type |
|------|------|
| aws_vpc.main | resource |
| aws_internet_gateway.main | resource |
| aws_subnet.public | resource |
| aws_subnet.private | resource |
| aws_subnet.database | resource |
| aws_eip.nat | resource |
| aws_nat_gateway.main | resource |
| aws_route_table.public | resource |
| aws_route_table.private | resource |
| aws_route_table.database | resource |
| aws_route.public | resource |
| aws_route.private | resource |
| aws_route.database | resource |
| aws_route_table_association.public | resource |
| aws_route_table_association.private | resource |
| aws_route_table_association.database | resource |

---

```
```
## Inputs

| Name | Description | Type | Required |
|------|------------|------|----------|
| project | Project name for resource naming | `string` | yes |
| environment | Environment (dev/qa/uat/prod) | `string` | yes |
| vpc_cidr | CIDR block for VPC | `string` | no |
| public_subnet_cidrs | Public subnet CIDRs | `list(string)` | no |
| private_subnet_cidrs | Private subnet CIDRs | `list(string)` | no |
| database_subnet_cidrs | Database subnet CIDRs | `list(string)` | no |
| is_peering_required | Enable VPC peering | `bool` | no |

---

```
```

## Outputs

| Name | Description |
|------|------------|
| vpc_id | VPC ID |
| public_subnet_ids | Public subnet IDs |
| private_subnet_ids | Private subnet IDs |
| database_subnet_ids | Database subnet IDs |

---
```
```

## Naming Convention

Resources follow this format:

{project}-{environment}-{tier}-{az}

Example:

- roboshop-dev-public-us-east-1a
- roboshop-dev-private-us-east-1b
- roboshop-dev-database-us-east-1a

---
```
```
![VPC_Module](./images/vpc_module..png)

```
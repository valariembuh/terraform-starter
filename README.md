# 🚀 Terraform AWS Scalable Infrastructure (VPC + ALB + ASG)

A production-style Infrastructure as Code (IaC) project built with Terraform to deploy a scalable and highly available AWS architecture using modular design principles.



## 🏗️ Architecture Overview

This project deploys a highly available AWS infrastructure:

- Custom VPC with public subnets
- Application Load Balancer (ALB)
- Target Group for traffic routing
- Auto Scaling Group (ASG) for scalability
- EC2 instances running Apache web server
- Security Groups for controlled access



## 🔁 Traffic Flow

User Browser → Application Load Balancer → Target Group → Auto Scaling Group → EC2 Instances → HTTP Response


## ⚙️ Tech Stack

- Terraform (Infrastructure as Code)
- AWS (VPC, EC2, ALB, Auto Scaling, Security Groups)
- Amazon Linux 2
- Apache HTTP Server
- Git & GitHub (Version Control)


## 🚀 How to Deploy

```bash
terraform init
terraform plan
terraform apply

👤 Author

Built by **Valarie M Atsimbom**  
Cloud Engineering & DevOps Learning Project (Hands-on Terraform & AWS Infrastructure)
Focused on building real-world AWS infrastructure using Terraform

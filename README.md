# 🚀 Terraform AWS Scalable Infrastructure (VPC + ALB + ASG)

This project builds a **production-style AWS infrastructure** using Terraform modules.

---

## 🏗️ Architecture

- VPC with public subnets
- Application Load Balancer (ALB)
- Target Group
- Auto Scaling Group (ASG)
- EC2 instances (Apache web server)
- Security Groups

---

## 🔁 Flow

Browser → ALB → Target Group → ASG → EC2 → HTTP Response

---

## ⚙️ Tech Stack

- Terraform
- AWS (EC2, VPC, ALB, ASG, SG)
- Amazon Linux 2
- Apache HTTP Server

---

## 🚀 How to Deploy

```bash
terraform init
terraform plan
terraform apply

👤 Author

Built by Valarie Mbuh Atsimbom as part of DevOps Freelancing
